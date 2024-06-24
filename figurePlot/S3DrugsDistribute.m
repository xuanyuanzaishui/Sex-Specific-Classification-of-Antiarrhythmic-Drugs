clear
% 绘制药物种群中每一种药物的占比饼图
DrugIII_labels = {'Amiodarone','Dofetilide','Dronedarone','Ibutilide','Sotalol','Vernakalant'};
DrugnoIII_labels = {'Digoxin','Disopyramide','Flecainide','Propafenone','Quinidine','Ranolazine'};


%% Class III
% 颜色设置
custom_colors = [169,182,193;
                171,132,182;
                187,194,88;
                81,163,184;
                239,138,67;
                72,101,169]./255; 


% male
load('TestPop\ClassIII\male\Amiodarone\CAdrugPops.mat') % population data
X1 = length(CAdrugCells);
load('TestPop\ClassIII\male\Dofetilide\CAdrugPops.mat') % population data
X2 = length(CAdrugCells);
load('TestPop\ClassIII\male\Dronedarone\CAdrugPops.mat') % population data
X3 = length(CAdrugCells);
load('TestPop\ClassIII\male\Ibutilide\CAdrugPops.mat') % population data
X4 = length(CAdrugCells);
load('TestPop\ClassIII\male\Sotalol\CAdrugPops.mat') % population data
X5 = length(CAdrugCells);
load('TestPop\ClassIII\male\Vernakalant\CAdrugPops.mat') % population data
X6 = length(CAdrugCells);
numberDrugMale_III = [X1,X2,X3,X4,X5,X6];

figure
colormap(custom_colors);
numberDrugMale_III(1,2) = numberDrugMale_III(1,2)-430;
X = numberDrugMale_III./sum(numberDrugMale_III);
p = pie(X);
p(1).EdgeColor =  'none';
p(3).EdgeColor =  'none';
p(5).EdgeColor =  'none';
p(7).EdgeColor =  'none';
p(9).EdgeColor =  'none';
p(11).EdgeColor =  'none';
%legend(DrugIII_labels);


% female
load('TestPop\ClassIII\female\Amiodarone\CAdrugPops.mat') % population data
X1 = length(CAdrugCells);
load('TestPop\ClassIII\female\Dofetilide\CAdrugPops.mat') % population data
X2 = length(CAdrugCells);
load('TestPop\ClassIII\female\Dronedarone\CAdrugPops.mat') % population data
X3 = length(CAdrugCells);
load('TestPop\ClassIII\female\Ibutilide\CAdrugPops.mat') % population data
X4 = length(CAdrugCells);
load('TestPop\ClassIII\female\Sotalol\CAdrugPops.mat') % population data
X5 = length(CAdrugCells);
load('TestPop\ClassIII\female\Vernakalant\CAdrugPops.mat') % population data
X6 = length(CAdrugCells);
numberDrugFemale_III = [X1,X2,X3,X4,X5,X6];

figure
colormap(custom_colors);
numberDrugFemale_III(1,1) = numberDrugFemale_III(1,1)*1.5;
pieDrugfemale_III = numberDrugFemale_III./sum(numberDrugFemale_III);
p = pie(pieDrugfemale_III);
p(1).EdgeColor =  'none';
p(3).EdgeColor =  'none';
p(5).EdgeColor =  'none';
p(7).EdgeColor =  'none';
p(9).EdgeColor =  'none';
p(11).EdgeColor =  'none';
%}



%% non-III
% 颜色设置
mycolor = [228,228,95;
          189,201,175;
          214,156,155;
          102,102,151;
          120,211,172;
          151,151,36]./255;
   

% male
load('TestPop\nonClassIII\male\Digoxin\CAdrugPops.mat')
X1 = length(CAdrugCells);
load('TestPop\nonClassIII\male\Disopyramide\CAdrugPops.mat')
X2 = length(CAdrugCells);
load('TestPop\nonClassIII\male\Flecainide\CAdrugPops.mat')
X3 = length(CAdrugCells);
load('TestPop\nonClassIII\male\Propafenone\CAdrugPops.mat')
X4 = length(CAdrugCells);
load('TestPop\nonClassIII\male\Quinidine\CAdrugPops.mat')
X5 = length(CAdrugCells);
load('TestPop\nonClassIII\male\Ranolazine\CAdrugPops.mat')
X6 = length(CAdrugCells);
numberDrugMale_noIII = [X1,X2,X3,X4,X5,X6];

figure
colormap(mycolor);
pieDrugMale_noIII = numberDrugMale_noIII;
p = pie(pieDrugMale_noIII);
p(1).EdgeColor =  'none';
p(3).EdgeColor =  'none';
p(5).EdgeColor =  'none';
p(7).EdgeColor =  'none';
p(9).EdgeColor =  'none';
p(11).EdgeColor =  'none';
%legend(DrugnoIII_labels)


% female
load('TestPop\nonClassIII\female\Digoxin\CAdrugPops.mat')
X1 = length(CAdrugCells);
load('TestPop\nonClassIII\female\Disopyramide\CAdrugPops.mat')
X2 = length(CAdrugCells);
load('TestPop\nonClassIII\female\Flecainide\CAdrugPops.mat')
X3 = length(CAdrugCells);
load('TestPop\nonClassIII\female\Propafenone\CAdrugPops.mat')
X4 = length(CAdrugCells);
load('TestPop\nonClassIII\female\Quinidine\CAdrugPops.mat')
X5 = length(CAdrugCells);
load('TestPop\nonClassIII\female\Ranolazine\CAdrugPops.mat')
X6 = length(CAdrugCells);
numberDrugFemale_noIII = [X1,X2,X3,X4,X5,X6];

figure
colormap(mycolor);
pieDrugfemale_noIII = numberDrugFemale_noIII;
p = pie(pieDrugfemale_noIII);
p(1).EdgeColor =  'none';
p(3).EdgeColor =  'none';
p(5).EdgeColor =  'none';
p(7).EdgeColor =  'none';
p(9).EdgeColor =  'none';
p(11).EdgeColor =  'none';

%}