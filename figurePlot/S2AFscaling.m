%% AF mainFunction
clear
% 数据装载S
load('TestPop\AF\male\AFconductancesM.mat')
load('TestPop\AF\female\AFconductancesF.mat')

 
%%------离子参数---------
% 'GNa', 'GNaL', 'Gto', 'GKr', 'GKs', 'GKur','GK1',
% 'GCaL', 'Pnak', 'Gncx', 'GpCa', 'Rel', 'SERCA', 'Leak'
StandardValues = [23;0.0025;0.165;0.035;0.0035;0.045;0.0525;1.0;1.26;3.15;0.0471;1.0;1.0;1.0];
for i = 1:length(AFconductancesM)
    conductance(i,:) = stc2double(AFconductancesM(i).c);
end
for j = 1:14
    conductanceM(:,j) = conductance(:,j) ./ StandardValues(j);
end

for i = 1:length(AFconductancesF)
    conductance(i,:) = stc2double(AFconductancesF(i).c);
end
for j = 1:14
    conductanceF(:,j) = conductance(:,j) ./ StandardValues(j);
end

%% figure
c1 = [37 109 183]/255; %male color map
c2 = [253 160 192]/255; %female color map

m_I1 = conductanceM(:,1); %0.2
f_I1 = conductanceF(:,1); %BinWidth0.15

m_I2 = conductanceM(:,2); %0.25
f_I2 = conductanceF(:,2); %0.2

m_I3 = conductanceM(:,3); %0.225
f_I3 = conductanceF(:,3); %0.175

m_I4 = conductanceM(:,4); %0.25
f_I4 = conductanceF(:,4); %0.2

m_I5 = conductanceM(:,5);%0.25
f_I5 = conductanceF(:,5);%0.2

m_I6 = conductanceM(:,6);%0.25
f_I6 = conductanceF(:,6);%0.2

m_I7 = conductanceM(:,7);%0.25
f_I7 = conductanceF(:,7);%0.2

m_I8 = conductanceM(:,8);%0.2
f_I8 = conductanceF(:,8);%0.15

m_I9 = conductanceM(:,9); %0.25
f_I9 = conductanceF(:,9);%0.2

m_I10 = conductanceM(:,10); %%0.25
f_I10 = conductanceF(:,10);%0.2

m_I11 = conductanceM(:,11);%0.25
f_I11 = conductanceF(:,11);%0.2

m_I12 = conductanceM(:,12);%0.25
f_I12 = conductanceF(:,12);%0.2

m_I13 = conductanceM(:,13);%0.25
f_I13 = conductanceF(:,13);%0.2

m_I14 = conductanceM(:,14);%0.25
f_I14 = conductanceF(:,14);%0.2

h1 = histogram(m_I8,'BinLimits',[0,3]);
h1.BinWidth = 0.1;
h1.FaceColor = c1;
h1.EdgeColor = c1;

hold on
h2 = histogram(f_I8,'BinLimits',[0,3]);
h2.BinWidth = 0.1;
h2.FaceColor = c2;
h2.EdgeColor = c2;

box off;
hold off


%均值和方差
% male离子参数
meanM = mean(conductanceM);
stdM = std(conductanceM);

% female离子参数
meanF = mean(conductanceF);
stdF = std(conductanceF);

outputScalingMS = [meanM;stdM;meanF;stdF];



%% csv
Output_Dir = 'F:\PopDate\gender_Pop_github\TestPop\'; % path

%%------离子参数---------
outputlabels2 = {'GNa', 'GNaL', 'Gto', 'GKr', 'GKs', 'GKur',...
     'GK1','GCaL', 'Pnak', 'Gncx', 'GpCa', 'Rel', 'SERCA', 'Leak'};%labels
% male
Output_File = 'AFscalingsM.csv'; %用于t检验
outputFile(Output_Dir,Output_File,conductanceM,outputlabels2)

% female
Output_File = 'AFscalingsF.csv'; %用于t检验
outputFile(Output_Dir,Output_File,conductanceF,outputlabels2)

% mean std (male female)
Output_File = 'AFscalingsMean.csv';
outputFile(Output_Dir,Output_File,outputScalingMS,outputlabels2)

disp('finish')


%% function
%
function outputFile(Output_Dir,Output_File,outputFeature,outputlabels)
        path = fullfile(Output_Dir,Output_File);
        if isfile(path)
            disp('FILE ALREADY EXISTS.')
        else
            fid = fopen(Output_File, 'w') ;
            fprintf(fid, '%s,', outputlabels{1,1:end-1}) ;
            fprintf(fid, '%s\n', outputlabels{1,end}) ;
            fclose(fid) ;
            dlmwrite(Output_File, outputFeature, '-append') ;
        end
end

%
function conductances = stc2double(c)
    GNa  = c.G.GNa ;
    GNaL = c.G.GNaL ;
    Gto  = c.G.Gto ;
    GKr = c.G.GKr ;
    GKs = c.G.GKs ;
    GKur = c.G.GKur;
    GK1  = c.G.GK1;
    GCaL = c.G.GCaL;
    Pnak = c.G.Pnak;
    Gncx = c.G.Gncx;
    GpCa = c.G.GpCa;
    Rel   = c.G.Rel;
    SERCA = c.G.SERCA;
    Leak  = c.G.Leak ;
  conductances = [GNa GNaL Gto GKr GKs GKur GK1 GCaL Pnak Gncx GpCa Rel SERCA Leak];
end
