clear

%% load drugs date
load('TestPop\AF\female\AFfeaturesf.mat')
AF_feature = AFfeaturesf;
CAdrugFeature =[];
BaseFeName = {'RMP', 'dV/dtmax', 'APA', 'APD20', 'APD40', 'APD50',...
     'APD90','APD90', 'DCai', 'CTA', 'CTD50', 'CTD90', 'CTDtri', 'dCa'};

%%
load('TestPop\ClassIII\female\Amiodarone\CABaseCells.mat') % population data
[CAdrugFeature,CAdrugCells,Y_CA] = Calibrate(AF_feature,CABaseCells);

matfile = fullfile('TestPop\ClassIII\female\Amiodarone\', 'CAdrugPops.mat');
save(matfile,'CAdrugCells','Y_CA')
matfile = fullfile('TestPop\ClassIII\female\Amiodarone\', 'CAdrugFea.mat');
save(matfile,'CAdrugFeature','BaseFeName')

%%
load('TestPop\ClassIII\female\Dofetilide\CABaseCells.mat') % population data
[CAdrugFeature,CAdrugCells,Y_CA] = Calibrate(AF_feature,CABaseCells);

matfile = fullfile('TestPop\ClassIII\female\Dofetilide\', 'CAdrugPops.mat');
save(matfile,'CAdrugCells','Y_CA')
matfile = fullfile('TestPop\ClassIII\female\Dofetilide\', 'CAdrugFea.mat');
save(matfile,'CAdrugFeature','BaseFeName')

%%
load('TestPop\ClassIII\female\Dronedarone\CABaseCells.mat') % population data
[CAdrugFeature,CAdrugCells,Y_CA] = Calibrate(AF_feature,CABaseCells);

matfile = fullfile('TestPop\ClassIII\female\Dronedarone\', 'CAdrugPops.mat');
save(matfile,'CAdrugCells','Y_CA')
matfile = fullfile('TestPop\ClassIII\female\Dronedarone\', 'CAdrugFea.mat');
save(matfile,'CAdrugFeature','BaseFeName')
%%
load('TestPop\ClassIII\female\Ibutilide\CABaseCells.mat') % population data
[CAdrugFeature,CAdrugCells,Y_CA] = Calibrate(AF_feature,CABaseCells);

matfile = fullfile('TestPop\ClassIII\female\Ibutilide\', 'CAdrugPops.mat');
save(matfile,'CAdrugCells','Y_CA')
matfile = fullfile('TestPop\ClassIII\female\Ibutilide\', 'CAdrugFea.mat');
save(matfile,'CAdrugFeature','BaseFeName')
%%
load('TestPop\ClassIII\female\Sotalol\CABaseCells.mat') % population data
[CAdrugFeature,CAdrugCells,Y_CA] = Calibrate(AF_feature,CABaseCells);

matfile = fullfile('TestPop\ClassIII\female\Sotalol\', 'CAdrugPops.mat');
save(matfile,'CAdrugCells','Y_CA')
matfile = fullfile('TestPop\ClassIII\female\Sotalol\', 'CAdrugFea.mat');
save(matfile,'CAdrugFeature','BaseFeName')

%%
load('TestPop\ClassIII\female\Vernakalant\CABaseCells.mat') % population data
[CAdrugFeature,CAdrugCells,Y_CA] = Calibrate(AF_feature,CABaseCells);

matfile = fullfile('TestPop\ClassIII\female\Vernakalant\', 'CAdrugPops.mat');
save(matfile,'CAdrugCells','Y_CA')
matfile = fullfile('TestPop\ClassIII\female\Vernakalant\', 'CAdrugFea.mat');
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
