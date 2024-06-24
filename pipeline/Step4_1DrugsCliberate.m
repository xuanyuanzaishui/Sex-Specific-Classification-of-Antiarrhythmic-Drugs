clear

%% load drugs date
load('TestPop\AF\male\AFfeaturesm.mat')
AF_feature = AFfeaturesm;
CAdrugFeature =[];
BaseFeName = {'RMP', 'dV/dtmax', 'APA', 'APD20', 'APD40', 'APD50',...
     'APD90','APD90', 'DCai', 'CTA', 'CTD50', 'CTD90', 'CTDtri', 'dCa'};

%%
load('TestPop\ClassIII\male\Amiodarone\CABaseCells.mat') % population data
[CAdrugFeature,CAdrugCells,Y_CA] = Calibrate(AF_feature,CABaseCells);

matfile = fullfile('TestPop\ClassIII\male\Amiodarone\', 'CAdrugPops.mat');
save(matfile,'CAdrugCells','Y_CA')
matfile = fullfile('TestPop\ClassIII\male\Amiodarone\', 'CAdrugFea.mat');
save(matfile,'CAdrugFeature','BaseFeName')

%%
load('TestPop\ClassIII\male\Dofetilide\CABaseCells.mat') % population data
[CAdrugFeature,CAdrugCells,Y_CA] = Calibrate(AF_feature,CABaseCells);

matfile = fullfile('TestPop\ClassIII\male\Dofetilide\', 'CAdrugPops.mat');
save(matfile,'CAdrugCells','Y_CA')
matfile = fullfile('TestPop\ClassIII\male\Dofetilide\', 'CAdrugFea.mat');
save(matfile,'CAdrugFeature','BaseFeName')

%%
load('TestPop\ClassIII\male\Dronedarone\CABaseCells.mat') % population data
[CAdrugFeature,CAdrugCells,Y_CA] = Calibrate(AF_feature,CABaseCells);

matfile = fullfile('TestPop\ClassIII\male\Dronedarone\', 'CAdrugPops.mat');
save(matfile,'CAdrugCells','Y_CA')
matfile = fullfile('TestPop\ClassIII\male\Dronedarone\', 'CAdrugFea.mat');
save(matfile,'CAdrugFeature','BaseFeName')
%%
load('TestPop\ClassIII\male\Ibutilide\CABaseCells.mat') % population data
[CAdrugFeature,CAdrugCells,Y_CA] = Calibrate(AF_feature,CABaseCells);

matfile = fullfile('TestPop\ClassIII\male\Ibutilide\', 'CAdrugPops.mat');
save(matfile,'CAdrugCells','Y_CA')
matfile = fullfile('TestPop\ClassIII\male\Ibutilide\', 'CAdrugFea.mat');
save(matfile,'CAdrugFeature','BaseFeName')
%%
load('TestPop\ClassIII\male\Sotalol\CABaseCells.mat') % population data
[CAdrugFeature,CAdrugCells,Y_CA] = Calibrate(AF_feature,CABaseCells,CApopConductance);

matfile = fullfile('TestPop\ClassIII\male\Sotalol\', 'CAdrugPops.mat');
save(matfile,'CAdrugCells','Y_CA')
matfile = fullfile('TestPop\ClassIII\male\Sotalol\', 'CAdrugFea.mat');
save(matfile,'CAdrugFeature','BaseFeName')

%%
load('TestPop\ClassIII\male\Vernakalant\CABaseCells.mat') % population data
[CAdrugFeature,CAdrugCells,Y_CA] = Calibrate(AF_feature,CABaseCells,CApopConductance);

matfile = fullfile('TestPop\ClassIII\male\Vernakalant\', 'CAdrugPops.mat');
save(matfile,'CAdrugCells','Y_CA')
matfile = fullfile('TestPop\ClassIII\male\Vernakalant\', 'CAdrugFea.mat');
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
