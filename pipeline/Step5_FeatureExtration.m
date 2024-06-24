clear

%% ClassIII male
ClassIIImale = [];
load('TestPop\ClassIII\female\Amiodarone\APchanges.mat')
ClassIIImale = [ClassIIImale;APchanges];
load('TestPop\ClassIII\female\Dofetilide\APchanges.mat')
ClassIIImale = [ClassIIImale;APchanges];
load('TestPop\ClassIII\female\Dronedarone\APchanges.mat')
ClassIIImale = [ClassIIImale;APchanges];
load('TestPop\ClassIII\female\Ibutilide\APchanges.mat')
ClassIIImale = [ClassIIImale;APchanges];
load('TestPop\ClassIII\female\Sotalol\APchanges.mat')
ClassIIImale = [ClassIIImale;APchanges];
load('TestPop\ClassIII\female\Vernakalant\APchanges.mat')
ClassIIImale = [ClassIIImale;APchanges];

ClassIIImale(:,15) = 1;

%% ClassIII female
ClassIIIfemale = [];
load('TestPop\ClassIII\female\Amiodarone\APchanges.mat')
ClassIIIfemale = [ClassIIIfemale;APchanges];
load('TestPop\ClassIII\female\Dofetilide\APchanges.mat')
ClassIIIfemale = [ClassIIIfemale;APchanges];
load('TestPop\ClassIII\female\Dronedarone\APchanges.mat')
ClassIIIfemale = [ClassIIIfemale;APchanges];
load('TestPop\ClassIII\female\Ibutilide\APchanges.mat')
ClassIIIfemale = [ClassIIIfemale;APchanges];
load('TestPop\ClassIII\female\Sotalol\APchanges.mat')
ClassIIIfemale = [ClassIIIfemale;APchanges];
load('TestPop\ClassIII\female\Vernakalant\APchanges.mat')
ClassIIIfemale = [ClassIIIfemale;APchanges];

ClassIIIfemale(:,15) = 1;

%% nonClassIII male
nonClassIIImale = [];
load('TestPop\nonClassIII\male\Digoxin\APchanges.mat')
nonClassIIImale = [nonClassIIImale;APchanges];
load('TestPop\nonClassIII\male\Disopyramide\APchanges.mat')
nonClassIIImale = [nonClassIIImale;APchanges];
load('TestPop\nonClassIII\male\Flecainide\APchanges.mat')
nonClassIIImale = [nonClassIIImale;APchanges];
load('TestPop\nonClassIII\male\Propafenone\APchanges.mat')
nonClassIIImale = [nonClassIIImale;APchanges];
load('TestPop\nonClassIII\male\Quinidine\APchanges.mat')
nonClassIIImale = [nonClassIIImale;APchanges];
load('TestPop\nonClassIII\male\Ranolazine\APchanges.mat')
nonClassIIImale = [nonClassIIImale;APchanges];

nonClassIIImale(:,15) = 0;

%% nonClassIII female
nonClassIIIfemale = [];
load('TestPop\nonClassIII\female\Digoxin\APchanges.mat')
nonClassIIIfemale = [nonClassIIIfemale;APchanges];
load('TestPop\nonClassIII\female\Disopyramide\APchanges.mat')
nonClassIIIfemale = [nonClassIIIfemale;APchanges];
load('TestPop\nonClassIII\female\Flecainide\APchanges.mat')
nonClassIIIfemale = [nonClassIIIfemale;APchanges];
load('TestPop\nonClassIII\female\Propafenone\APchanges.mat')
nonClassIIIfemale = [nonClassIIIfemale;APchanges];
load('TestPop\nonClassIII\female\Quinidine\APchanges.mat')
nonClassIIIfemale = [nonClassIIIfemale;APchanges];
load('TestPop\nonClassIII\female\Ranolazine\APchanges.mat')
nonClassIIIfemale = [nonClassIIIfemale;APchanges];

nonClassIIIfemale(:,15) = 0;

%% 输出特征集
MLFeature1 = [ClassIIImale;ClassIIIfemale;nonClassIIImale;nonClassIIIfemale];
rowrank = randperm(size(MLFeature1, 1)); % size获得行数，randperm打乱各行的顺序
MLFeature = MLFeature1(rowrank,:); 

MLFeatureM1 = [ClassIIImale;nonClassIIImale];
rowrank = randperm(size(MLFeatureM1, 1)); % size获得行数，randperm打乱各行的顺序
MLFeatureM = MLFeatureM1(rowrank,:); 

MLFeatureF1 = [ClassIIIfemale;nonClassIIIfemale];
rowrank = randperm(size(MLFeatureF1, 1)); % size获得行数，randperm打乱各行的顺序
MLFeatureF = MLFeatureF1(rowrank,:); 

Output_Dir = 'F:\PopDate\gender_Pop_github\TestPop\'; % path

outputlabels = {'RMP', 'dV/dtmax', 'APA', 'APD20', 'APD40', 'APD50',...
     'APD90','APDtri', 'CTA', 'CTmax', 'CTD50', 'CTD90', 'CTDtri', 'CTD', 'DrugLabel'};

% all  
Output_File = 'MLFeature.csv';
outputFile(Output_Dir,Output_File,MLFeature,outputlabels)
% male
Output_File = 'MLFeatureM.csv';
outputFile(Output_Dir,Output_File,MLFeatureM,outputlabels)
% female
Output_File = 'MLFeatureF.csv';
outputFile(Output_Dir,Output_File,MLFeatureF,outputlabels)

disp('finish')


%%
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
%}

