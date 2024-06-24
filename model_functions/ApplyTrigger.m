function ApplyTrigger(settings,pert)

%% Standard Settings
settings.nBeats = 500 ; % Number of beats to simulate
settings.numbertokeep = 2 ;% Determine how many beats to keep. 1 = last beat, 2 = last two beats

%% Load ICs from Folder 
File = fullfile(settings.Folder,'AFpopulationM.mat');
load(File,'AFpopvousiousM','AFpopICsM');
[variations,~] = size(AFpopvousiousM);

cx=1;
%% Set Intervals 
% Since populations are so large, we need to divide how we save the data
% into intervals. Number of sections is determined by input.
intervals = chunks(variations);
chunk_settings = settings;
yourFolder = fullfile(settings.Folder,settings.SubFolder); 
if ~exist(yourFolder, 'dir')
    mkdir(yourFolder)
end

%% Run Simulation
for ii = 1:size(intervals,1)
    % Set Up Population Variants
    n = intervals(ii,1):intervals(ii,2);
    chunk_settings.ICs = AFpopICsM(n,:);
    chunk_settings.scalings = AFpopvousiousM(n,:);
    chunk_settings.variations = length(n);
    
    X = runSim(chunk_settings,pert); % run simulation    
    
    for jj = 1:length(X) %for each member of the population
        CABaseCells(cx).times = X(jj).times;
        CABaseCells(cx).V = X(jj).states(:,39);
        CABaseCells(cx).Cai = X(jj).states(:,38);
        cx = cx + 1;
    end
    clear X
    disp([num2str((ii/size(intervals,1))*100) '% Finished '])
end

% Save Data
matfile = fullfile(yourFolder, 'CABaseCells.mat');
save(matfile,'CABaseCells')

%% -- Nested Functions 
    function intervals = chunks(variations)
    if variations > 1000
        ints = round(linspace(0,variations,variations/300));
        intervals = zeros((length(ints) - 1),2);
        for i = 1:(length(ints) - 1)
            intervals(i,1:2) = [ints(i)+1 ints(i+1)];
        end
    else
        intervals = [1 variations];
    end