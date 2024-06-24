clear

%% ClassIII

load('TestPop\ClassIII\male\Amiodarone\CAdrugFea.mat')
ClassIII_1 = CAdrugFeature;
load('TestPop\ClassIII\female\Amiodarone\CAdrugFea.mat')
ClassIII_1 = [ClassIII_1;CAdrugFeature];
meanIII_1 = mean(ClassIII_1);
stdIII_1 = std(ClassIII_1);

load('TestPop\ClassIII\male\Dofetilide\CAdrugFea.mat')
ClassIII_2 = CAdrugFeature;
load('TestPop\ClassIII\female\Dofetilide\CAdrugFea.mat')
ClassIII_2 = [ClassIII_2;CAdrugFeature];
meanIII_2 = mean(ClassIII_2);
stdIII_2 = std(ClassIII_2);

load('TestPop\ClassIII\male\Dronedarone\CAdrugFea.mat')
ClassIII_3 = CAdrugFeature;
load('TestPop\ClassIII\female\Dronedarone\CAdrugFea.mat')
ClassIII_3 = [ClassIII_3;CAdrugFeature];
meanIII_3 = mean(ClassIII_3);
stdIII_3 = std(ClassIII_3);

load('TestPop\ClassIII\male\Ibutilide\CAdrugFea.mat')
ClassIII_4 = CAdrugFeature;
load('TestPop\ClassIII\female\Ibutilide\CAdrugFea.mat')
ClassIII_4 = [ClassIII_4;CAdrugFeature];
meanIII_4 = mean(ClassIII_4);
stdIII_4 = std(ClassIII_4);

load('TestPop\ClassIII\male\Sotalol\CAdrugFea.mat')
ClassIII_5 = CAdrugFeature;
load('TestPop\ClassIII\female\Sotalol\CAdrugFea.mat')
ClassIII_5 = [ClassIII_5;CAdrugFeature];
meanIII_5 = mean(ClassIII_5);
stdIII_5 = std(ClassIII_5);

load('TestPop\ClassIII\male\Vernakalant\CAdrugFea.mat')
ClassIII_6 = CAdrugFeature;
load('TestPop\ClassIII\female\Vernakalant\CAdrugFea.mat')
ClassIII_6 = [ClassIII_6;CAdrugFeature];
meanIII_6 = mean(ClassIII_6);
stdIII_6 = std(ClassIII_6);

% all
ClassIII_7 = [ClassIII_1;ClassIII_2;ClassIII_3;ClassIII_4;ClassIII_5;ClassIII_6];
meanIII_7 = mean(ClassIII_7);
stdIII_7 = std(ClassIII_7);


%% nonClassIII

load('TestPop\nonClassIII\male\Digoxin\CAdrugFea.mat')
nonClassIII_1 = CAdrugFeature;
load('TestPop\nonClassIII\female\Digoxin\CAdrugFea.mat')
nonClassIII_1 = [nonClassIII_1;CAdrugFeature];
meanIIInon_1 = mean(nonClassIII_1);
stdIIInon_1 = std(nonClassIII_1);

load('TestPop\nonClassIII\male\Disopyramide\CAdrugFea.mat')
nonClassIII_2 = CAdrugFeature;
load('TestPop\nonClassIII\female\Disopyramide\CAdrugFea.mat')
nonClassIII_2 = [nonClassIII_2;CAdrugFeature];
meanIIInon_2 = mean(nonClassIII_2);
stdIIInon_2 = std(nonClassIII_2);

load('TestPop\nonClassIII\male\Flecainide\CAdrugFea.mat')
nonClassIII_3 = CAdrugFeature;
load('TestPop\nonClassIII\female\Flecainide\CAdrugFea.mat')
nonClassIII_3 = [nonClassIII_3;CAdrugFeature];
meanIIInon_3 = mean(nonClassIII_3);
stdIIInon_3 = std(nonClassIII_3);

load('TestPop\nonClassIII\male\Propafenone\CAdrugFea.mat')
nonClassIII_4 = CAdrugFeature;
load('TestPop\nonClassIII\female\Propafenone\CAdrugFea.mat')
nonClassIII_4 = [nonClassIII_4;CAdrugFeature];
meanIIInon_4 = mean(nonClassIII_4);
stdIIInon_4 = std(nonClassIII_4);

load('TestPop\nonClassIII\male\Quinidine\CAdrugFea.mat')
nonClassIII_5 = CAdrugFeature;
load('TestPop\nonClassIII\female\Quinidine\CAdrugFea.mat')
nonClassIII_5 = [nonClassIII_5;CAdrugFeature];
meanIIInon_5 = mean(nonClassIII_5);
stdIIInon_5 = std(nonClassIII_5);

load('TestPop\nonClassIII\male\Ranolazine\CAdrugFea.mat')
nonClassIII_6 = CAdrugFeature;
load('TestPop\nonClassIII\female\Ranolazine\CAdrugFea.mat')
nonClassIII_6 = [nonClassIII_6;CAdrugFeature];
meanIIInon_6 = mean(nonClassIII_6);
stdIIInon_6 = std(nonClassIII_6);

% all
nonClassIII_7 = [nonClassIII_1;nonClassIII_2;nonClassIII_3;nonClassIII_4;nonClassIII_5;nonClassIII_6];
meanIIInon_7 = mean(nonClassIII_7);
stdIIInon_7 = std(nonClassIII_7);


%% csv

outDrugsMean = [meanIII_1;stdIII_1;meanIII_2;stdIII_2;...
                meanIII_3;stdIII_3;meanIII_4;stdIII_4;...
                meanIII_5;stdIII_5;meanIII_6;stdIII_6;...
                meanIII_7;stdIII_7;meanIIInon_1;stdIIInon_1;...
                meanIIInon_2;stdIIInon_2;meanIIInon_3;stdIIInon_3;...
                meanIIInon_4;stdIIInon_4;meanIIInon_5;stdIIInon_5;...
                meanIIInon_6;stdIIInon_6;meanIIInon_7;stdIIInon_7];


outputlabels = {'RMP', 'dV/dtmax', 'APA', 'APD20', 'APD40', 'APD50',...
     'APD90','APDtri', 'CTA', 'CTmax', 'CTD50', 'CTD90', 'CTDtri', 'CTD'};%labels

Output_Dir = 'F:\PopDate\gender_Pop_github\Table\'; % path

%filename
Output_File = 'drugsMean_III.csv';
outputFile(Output_Dir,Output_File,outDrugsMean,outputlabels)


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