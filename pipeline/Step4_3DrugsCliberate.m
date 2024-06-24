clear

%% load drugs date
load('TestPop\AF\male\AFfeaturesm.mat')
AF_feature = AFfeaturesm;
CAdrugFeature =[];
BaseFeName = {'RMP', 'dV/dtmax', 'APA', 'APD20', 'APD40', 'APD50',...
     'APD90','APD90', 'DCai', 'CTA', 'CTD50', 'CTD90', 'CTDtri', 'dCa'};
Folder = 'TestPop\nonClassIII\male\';

%%
load('TestPop\nonClassIII\male\Digoxin\CABaseCells.mat') % population data
[CAdrugFeature,CAdrugCells,Y_CA] = Calibrate(AF_feature,CABaseCells);

matfile = fullfile(Folder,'Digoxin\', 'CAdrugPops.mat');
save(matfile,'CAdrugCells','Y_CA')
matfile = fullfile(Folder,'Digoxin\', 'CAdrugFea.mat');
save(matfile,'CAdrugFeature','BaseFeName')

%%
load('TestPop\nonClassIII\male\Propafenone\CABaseCells.mat') % population data
[CAdrugFeature,CAdrugCells,Y_CA] = Calibrate(AF_feature,CABaseCells);

matfile = fullfile(Folder,'Propafenone\', 'CAdrugPops.mat');
save(matfile,'CAdrugCells','Y_CA')
matfile = fullfile(Folder,'Propafenone\', 'CAdrugFea.mat');
save(matfile,'CAdrugFeature','BaseFeName')

%%
load('TestPop\nonClassIII\male\Ranolazine\CABaseCells.mat') % population data
[CAdrugFeature,CAdrugCells,Y_CA] = Calibrate(AF_feature,CABaseCells);

matfile = fullfile(Folder,'Ranolazine\', 'CAdrugPops.mat');
save(matfile,'CAdrugCells','Y_CA')
matfile = fullfile(Folder,'Ranolazine\', 'CAdrugFea.mat');
save(matfile,'CAdrugFeature','BaseFeName')

%%
load('TestPop\nonClassIII\male\Flecainide\CABaseCells.mat') % population data
[CAdrugFeature,CAdrugCells,Y_CA] = Calibrate(AF_feature,CABaseCells);

matfile = fullfile(Folder,'Flecainide\', 'CAdrugPops.mat');
save(matfile,'CAdrugCells','Y_CA')
matfile = fullfile(Folder,'Flecainide\', 'CAdrugFea.mat');
save(matfile,'CAdrugFeature','BaseFeName')

%%
load('TestPop\nonClassIII\male\Disopyramide\CABaseCells.mat') % population data
[CAdrugFeature,CAdrugCells,Y_CA] = Calibrate(AF_feature,CABaseCells);

matfile = fullfile(Folder,'Disopyramide\', 'CAdrugPops.mat');
save(matfile,'CAdrugCells','Y_CA')
matfile = fullfile(Folder,'Disopyramide\', 'CAdrugFea.mat');
save(matfile,'CAdrugFeature','BaseFeName')

%%
load('TestPop\nonClassIII\male\Quinidine\CABaseCells.mat') % population data
[CAdrugFeature,CAdrugCells,Y_CA] = Calibrate(AF_feature,CABaseCells);

matfile = fullfile(Folder,'Quinidine\', 'CAdrugPops.mat');
save(matfile,'CAdrugCells','Y_CA')
matfile = fullfile(Folder,'Quinidine\', 'CAdrugFea.mat');
save(matfile,'CAdrugFeature','BaseFeName')



%%
function [CAFeatures,CACells,Y_CA] = Calibrate(AF_feature,drugBaseCells)
            CAFeatures =[];
            Y_CA = zeros(length(AF_feature),1);
            a1 = 1;

            for i = 1:length(drugBaseCells)
                t = drugBaseCells(i).times;
                V = drugBaseCells(i).V;
                Cai = drugBaseCells(i).Cai;
                CABaseFea(1,:) = calculate_features(V,Cai,t);
    
                if ~anynan(CABaseFea(1,:)) 
                    diff_APD90 = CABaseFea(1,7)-AF_feature(i,7);
                    if diff_APD90>0 
                        CAFeatures(a1,:)=CABaseFea(1,:);
                        CACells(a1).times = drugBaseCells(i).times;
                        CACells(a1).V = drugBaseCells(i).V;
                        CACells(a1).Cai = drugBaseCells(i).Cai;
                        a1 = a1+1;
                        Y_CA(i,1) = 1;
                    end
                end
            end
end
