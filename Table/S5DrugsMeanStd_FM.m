clear

%% ClassIII male
ClassIIImale = [];
load('TestPop\ClassIII\male\Amiodarone\CAdrugFea.mat')
ClassIIImale = [ClassIIImale;CAdrugFeature];
load('TestPop\ClassIII\male\Dofetilide\CAdrugFea.mat')
ClassIIImale = [ClassIIImale;CAdrugFeature];
load('TestPop\ClassIII\male\Dronedarone\CAdrugFea.mat')
ClassIIImale = [ClassIIImale;CAdrugFeature];
load('TestPop\ClassIII\male\Ibutilide\CAdrugFea.mat')
ClassIIImale = [ClassIIImale;CAdrugFeature];
load('TestPop\ClassIII\male\Sotalol\CAdrugFea.mat')
ClassIIImale = [ClassIIImale;CAdrugFeature];
load('TestPop\ClassIII\male\Vernakalant\CAdrugFea.mat')
ClassIIImale = [ClassIIImale;CAdrugFeature];

meanClassIIIM = mean(ClassIIImale);
stdClassIIIM = std(ClassIIImale);


%% ClassIII female
ClassIIIfemale = [];
load('TestPop\ClassIII\female\Amiodarone\CAdrugFea.mat')
ClassIIIfemale = [ClassIIIfemale;CAdrugFeature];
load('TestPop\ClassIII\female\Dofetilide\CAdrugFea.mat')
ClassIIIfemale = [ClassIIIfemale;CAdrugFeature];
load('TestPop\ClassIII\female\Dronedarone\CAdrugFea.mat')
ClassIIIfemale = [ClassIIIfemale;CAdrugFeature];
load('TestPop\ClassIII\female\Ibutilide\CAdrugFea.mat')
ClassIIIfemale = [ClassIIIfemale;CAdrugFeature];
load('TestPop\ClassIII\female\Sotalol\CAdrugFea.mat')
ClassIIIfemale = [ClassIIIfemale;CAdrugFeature];
load('TestPop\ClassIII\female\Vernakalant\CAdrugFea.mat')
ClassIIIfemale = [ClassIIIfemale;CAdrugFeature];

meanClassIIIf = mean(ClassIIIfemale);
stdClassIIIf = std(ClassIIIfemale);

%% nonClassIII male
nonClassIIImale = [];
load('TestPop\nonClassIII\male\Digoxin\CAdrugFea.mat')
nonClassIIImale = [nonClassIIImale;CAdrugFeature];
load('TestPop\nonClassIII\male\Disopyramide\CAdrugFea.mat')
nonClassIIImale = [nonClassIIImale;CAdrugFeature];
load('TestPop\nonClassIII\male\Flecainide\CAdrugFea.mat')
nonClassIIImale = [nonClassIIImale;CAdrugFeature];
load('TestPop\nonClassIII\male\Propafenone\CAdrugFea.mat')
nonClassIIImale = [nonClassIIImale;CAdrugFeature];
load('TestPop\nonClassIII\male\Quinidine\CAdrugFea.mat')
nonClassIIImale = [nonClassIIImale;CAdrugFeature];
load('TestPop\nonClassIII\male\Ranolazine\CAdrugFea.mat')
nonClassIIImale = [nonClassIIImale;CAdrugFeature];

meannonClassIIIM = mean(nonClassIIImale);
stdnonClassIIIM = std(nonClassIIImale);

%% nonClassIII female
nonClassIIIfemale = [];
load('TestPop\nonClassIII\female\Digoxin\CAdrugFea.mat')
nonClassIIIfemale = [nonClassIIIfemale;CAdrugFeature];
load('TestPop\nonClassIII\female\Disopyramide\CAdrugFea.mat')
nonClassIIIfemale = [nonClassIIIfemale;CAdrugFeature];
load('TestPop\nonClassIII\female\Flecainide\CAdrugFea.mat')
nonClassIIIfemale = [nonClassIIIfemale;CAdrugFeature];
load('TestPop\nonClassIII\female\Propafenone\CAdrugFea.mat')
nonClassIIIfemale = [nonClassIIIfemale;CAdrugFeature];
load('TestPop\nonClassIII\female\Quinidine\CAdrugFea.mat')
nonClassIIIfemale = [nonClassIIIfemale;CAdrugFeature];
load('TestPop\nonClassIII\female\Ranolazine\CAdrugFea.mat')
nonClassIIIfemale = [nonClassIIIfemale;CAdrugFeature];

meannonClassIIIf = mean(nonClassIIIfemale);
stdnonClassIIIf = std(nonClassIIIfemale);

%% All

maleFeature = [ClassIIImale;nonClassIIImale];
meanM = mean(maleFeature);
stdF = std(maleFeature);

femaleFeature = [ClassIIIfemale;nonClassIIIfemale];
meanf = mean(femaleFeature);
stdf = std(femaleFeature);


%% csv
outDrugsMean_MF=[meanClassIIIM;stdClassIIIM;meanClassIIIf;stdClassIIIf;...
    meannonClassIIIM;stdnonClassIIIM;meannonClassIIIf;stdnonClassIIIf;...
    meanM;stdF;meanf;stdf];

outputlabels = {'RMP', 'dV/dtmax', 'APA', 'APD20', 'APD40', 'APD50',...
     'APD90','APDtri', 'CTA', 'CTmax', 'CTD50', 'CTD90', 'CTDtri', 'CTD'};%labels

Output_Dir = 'F:\PopDate\gender_Pop_github\Table\'; % path

%filename
Output_File = 'drugsMean_MF.csv';
outputFile(Output_Dir,Output_File,outDrugsMean_MF,outputlabels)%特征


%% 函数定义
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
%}