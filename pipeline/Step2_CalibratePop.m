%% Universal Settings for Calibrate Populations 
clear
load("BaseCells.mat")
load("BaseCellpopICs.mat")

c=1;
d=1;

for i = 1:length(AFBaseCells)
    ti = AFBaseCells(i).times;
    Vi = AFBaseCells(i).V;
    Caii = AFBaseCells(i).Cai .* 1000000;
    outputs = calculate_features(Vi,Caii,ti);

    RMP = outputs(1,1);
    dVdt = outputs(1,2);
    APA = outputs(1,3);
    APD20 = outputs(1,4);
    APD50 = outputs(1,6);
    APD90 = outputs(1,7);

    %AFRmale
    I1 = RMP > (-81.12) && RMP < (-74.02);
    I2 = APA > 95.6 && APA < 108.8;
    I3 = dVdt > 177.26 && dVdt < 319.2;
    I4 = APD20 > 11.23 && APD20 < 44.83;
    I5 = APD50 > 73.29 && APD50 < 125.09;
    I6 = APD90 > 182.21 && APD90 < 249.81;
    I = [I1,I2,I3,I4,I5,I6];
    %AFfemale
    J1 = RMP > (-80.82) && RMP < (-73.72);
    J2 = APA > 94.38 && APA < 107.58;
    J3 = dVdt > 162.13 && dVdt < 304.07;
    J4 = APD20 > 12.2 && APD20 < 45.8;
    J5 = APD50 > 75.89 && APD50 < 127.69;
    J6 = APD90 > 188.39 && APD90 < 255.99;   
    J = [J1,J2,J3,J4,J5,J6];

    if all(I == 1)
        AFBaseCellsM(c).times = BaseCells(i).times;
        AFBaseCellsM(c).V = BaseCells(i).V;
        AFBaseCellsM(c).Cai = BaseCells(i).Cai;
        AFpopICsM(c,:) = popICs(i,:);
        AFpopvousiousM(c,:) = popscalings(i,:);
        AFconductancesM(c).c = conductances(i).c;
        AFfeaturesM(c,:) = outputs(1,:);
        c=c+1;
    end
    if all(J == 1)
        AFBaseCellsF(d).times = BaseCells(i).times;
        AFBaseCellsF(d).V = BaseCells(i).V;
        AFBaseCellsF(d).Cai = BaseCells(i).Cai;
        AFpopICsF(d,:) = popICs(i,:);
        AFpopvousiousF(d,:) = popscalings(i,:);
        AFconductancesF(d).c = conductances(i).c;
        AFfeaturesF(d,:) = outputs(1,:);
        d=d+1;
    end
           
end

%
BaseFeName = {'RMP', 'dV/dtmax', 'APA', 'APD20', 'APD40', 'APD50',...
     'APD90','APDtri', 'CTA', 'CTmax', 'CTD50', 'CTD90', 'CTDtri', 'CTD'};

matfile = fullfile('TestPop\AF\male\', 'AFpopulationM.mat');
save(matfile,'AFBaseCellsM','AFpopICsM','AFpopvousiousM')
matfile = fullfile('TestPop\AF\male\', 'AFconductancesM.mat');
save(matfile,'AFconductancesM')
matfile = fullfile('TestPop\AF\male\', 'AFfeaturesM.mat');
save(matfile,'AFfeaturesM','BaseFeName')

matfile = fullfile('TestPop\AF\female\', 'AFpopulationF.mat');
save(matfile,'AFBaseCellsF','AFpopICsF','AFpopvousiousF')
matfile = fullfile('TestPop\AF\female\', 'AFconductancesF.mat');
save(matfile,'AFconductancesF')
matfile = fullfile('TestPop\AF\female\', 'AFfeaturesF.mat');
save(matfile,'AFfeaturesF','BaseFeName')
%}

disp('Saving population')