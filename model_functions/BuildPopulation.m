function BuildPopulation(settings,pert)
%--------------------------------------------------------------------------
%% -- BuildPopulation.m -- 
% Description: Build population

% Inputs:
% --> settings - [struct] simulation protocol settings
% --> pert  - [struct] initialize channel block settings

% Outputs: No actual outputs. Data is automatically saved to folder.
% -------------------------------------------------------------------------
%% Settings
settings.nBeats = 500; % Number of beats to simulate
settings.numbertokeep = 1 ;% Determine how many beats to keep. 2 = last two beat
settings.steady_state = true; % Start with each scenario's BL model steady state values.

%% Run Simulation

disp('Calibrate Population...')

% Does the user provide a parameter matrix or should we make one?
if ~isfield(settings,'scalings') 
    settings.scalings = popfuncs.create_scale_vector(settings,settings.variations);
end

% Separate population
intervals = chunks(settings,settings.variations);
chunk_settings = settings;

popICs = [];
popvousious = [];
% Loop through multiple intervals of the data
b=1;
for ii = 1:size(intervals,1)
    chunk_settings.scalings = settings.scalings(intervals(ii,1):intervals(ii,2),:);
    [chunk_settings.variations,~] = size(chunk_settings.scalings);
    X = runSim(chunk_settings,pert); % run simulation
    % save the ICs and scalings
    if ~isempty(X)
      for i = 1:length(X)
        BaseCells(b).times = X(i).times;
        BaseCells(b).V = X(i).states(:,39);
        BaseCells(b).Cai = X(i).states(:,38);
        popICs(end+1,:) = X(i).states(end,:);
        popvousious(end+1,:) = X(i).scalings;
        conductances(b,:) = X.conductances;
        b=b+1;
      end
    end
    clear X
    disp([num2str((ii/(size(intervals,1)))*100) '% Finished '])

end

matfile2 = fullfile(settings.Folder2, 'InitPopulation.mat');
save(matfile2, 'BaseCells')
matfile2 = fullfile(settings.Folder2, 'InitPopulationICs.mat');
save(matfile2,'popICs','popvousious','conductances')

%% Run Population using final steady state ICs 
% Run each cell in population with new steady state ICs 
BaseCells = Popdata(settings.ICs,settings.scalings,pert);

figure
for ii = 1:settings.variations
    
    plot(BaseCells(ii).times,BaseCells(ii).states(:,39),'linewidth',2,'Color',[0.75 0.75 0.75])
    hold on
    set(gca,'FontSize',14,'FontWeight','bold','FontName','Calibri','XGrid','on','YGrid','on')
    xlabel('time (ms)','FontSize',14,'FontWeight','bold','FontName','Calibri')
    ylabel('Voltage (mV)','FontSize',14,'FontWeight','bold','FontName','Calibri')
end
hold on
for jj = 1:length(popICs)
    
    plot(AFBaseCells1(jj).times,AFBaseCells1(jj).states(:,39),'linewidth',2,'Color','r')
    hold on
   
end
set(gcf,'Position',[400 258 500 420])
picfile = fullfile(settings.Folder2, 'Population.png');
saveas(gcf,picfile)

%% -- Nested Functions 
function intervals = chunks(~,variations)
    if variations > 1000
        ints = round(linspace(0,variations,variations/500));
        intervals = zeros((length(ints) - 1),2);
        for i = 1:(length(ints) - 1)
            intervals(i,1:2) = [ints(i)+1 ints(i+1)];
        end
    else
        intervals = [1 variations];
    end