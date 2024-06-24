clear

%% Class III
% male
Xm = 1;
load('TestPop\ClassIII\male\Amiodarone\CAdrugPops.mat') % population data
for i = 1:length(CAdurgCells)
    ClassIIImaleCells(Xm).times = CAdurgCells(i).times;
    ClassIIImaleCells(Xm).V = CAdurgCells(i).V;
    ClassIIImaleCells(Xm).Cai = CAdurgCells(i).Cai;
    Xm = Xm+1;  
end

load('TestPop\ClassIII\male\Dofetilide\CAdrugPops.mat') % population data
for i = 1:length(CAdurgCells)
    ClassIIImaleCells(Xm).times = CAdurgCells(i).times;
    ClassIIImaleCells(Xm).V = CAdurgCells(i).V;
    ClassIIImaleCells(Xm).Cai = CAdurgCells(i).Cai;
    Xm = Xm+1;  
end

load('TestPop\ClassIII\male\Dronedarone\CAdrugPops.mat') % population data
for i = 1:length(CAdurgCells)
    ClassIIImaleCells(Xm).times = CAdurgCells(i).times;
    ClassIIImaleCells(Xm).V = CAdurgCells(i).V;
    ClassIIImaleCells(Xm).Cai = CAdurgCells(i).Cai;
    Xm = Xm+1;  
end

load('TestPop\ClassIII\male\Ibutilide\CAdrugPops.mat') % population data
for i = 1:length(CAdurgCells)
    ClassIIImaleCells(Xm).times = CAdurgCells(i).times;
    ClassIIImaleCells(Xm).V = CAdurgCells(i).V;
    ClassIIImaleCells(Xm).Cai = CAdurgCells(i).Cai;
    Xm = Xm+1;  
end

load('TestPop\ClassIII\male\Sotalol\CAdrugPops.mat') % population data
for i = 1:length(CAdurgCells)
    ClassIIImaleCells(Xm).times = CAdurgCells(i).times;
    ClassIIImaleCells(Xm).V = CAdurgCells(i).V;
    ClassIIImaleCells(Xm).Cai = CAdurgCells(i).Cai;
    Xm = Xm+1;  
end

load('TestPop\ClassIII\male\Vernakalant\CAdrugPops.mat') % population data
for i = 1:length(CAdurgCells)
    ClassIIImaleCells(Xm).times = CAdurgCells(i).times;
    ClassIIImaleCells(Xm).V = CAdurgCells(i).V;
    ClassIIImaleCells(Xm).Cai = CAdurgCells(i).Cai;
    Xm = Xm+1;  
end

% female
Xf = 1;
load('TestPop\ClassIII\female\Amiodarone\CAdrugPops.mat') % population data
for i = 1:length(CAdurgCells)
    ClassIIIfemaleCells(Xf).times = CAdurgCells(i).times;
    ClassIIIfemaleCells(Xf).V = CAdurgCells(i).V;
    ClassIIIfemaleCells(Xf).Cai = CAdurgCells(i).Cai;
    Xf = Xf+1;  
end

load('TestPop\ClassIII\female\Dofetilide\CAdrugPops.mat') % population data
for i = 1:length(CAdurgCells)
    ClassIIIfemaleCells(Xf).times = CAdurgCells(i).times;
    ClassIIIfemaleCells(Xf).V = CAdurgCells(i).V;
    ClassIIIfemaleCells(Xf).Cai = CAdurgCells(i).Cai;
    Xf = Xf+1;  
end

load('TestPop\ClassIII\female\Dronedarone\CAdrugPops.mat') % population data
for i = 1:length(CAdurgCells)
    ClassIIIfemaleCells(Xf).times = CAdurgCells(i).times;
    ClassIIIfemaleCells(Xf).V = CAdurgCells(i).V;
    ClassIIIfemaleCells(Xf).Cai = CAdurgCells(i).Cai;
    Xf = Xf+1;  
end

load('TestPop\ClassIII\female\Ibutilide\CAdrugPops.mat') % population data
for i = 1:length(CAdurgCells)
    ClassIIIfemaleCells(Xf).times = CAdurgCells(i).times;
    ClassIIIfemaleCells(Xf).V = CAdurgCells(i).V;
    ClassIIIfemaleCells(Xf).Cai = CAdurgCells(i).Cai;
    Xf = Xf+1;  
end

load('TestPop\ClassIII\female\Sotalol\CAdrugPops.mat') % population data
for i = 1:length(CAdurgCells)
    ClassIIIfemaleCells(Xf).times = CAdurgCells(i).times;
    ClassIIIfemaleCells(Xf).V = CAdurgCells(i).V;
    ClassIIIfemaleCells(Xf).Cai = CAdurgCells(i).Cai;
    Xf = Xf+1;  
end

load('TestPop\ClassIII\female\Vernakalant\CAdrugPops.mat') % population data
for i = 1:length(CAdurgCells)
    ClassIIIfemaleCells(Xf).times = CAdurgCells(i).times;
    ClassIIIfemaleCells(Xf).V = CAdurgCells(i).V;
    ClassIIIfemaleCells(Xf).Cai = CAdurgCells(i).Cai;
    Xf = Xf+1;  
end


%% non-Class III
% male
Xm = 1;
load('TestPop\nonClassIII\male\Digoxin\CAdrugPops.mat')
for i = 1:length(CAdurgCells)
    nonClassIIImaleCells(Xm).times = CAdurgCells(i).times;
    nonClassIIImaleCells(Xm).V = CAdurgCells(i).V;
    nonClassIIImaleCells(Xm).Cai = CAdurgCells(i).Cai;
    Xm = Xm+1;  
end

load('TestPop\nonClassIII\male\Propafenone\CAdrugPops.mat')
for i = 1:length(CAdurgCells)
    nonClassIIImaleCells(Xm).times = CAdurgCells(i).times;
    nonClassIIImaleCells(Xm).V = CAdurgCells(i).V;
    nonClassIIImaleCells(Xm).Cai = CAdurgCells(i).Cai;
    Xm = Xm+1;  
end

load('TestPop\nonClassIII\male\Ranolazine\CAdrugPops.mat')
for i = 1:length(CAdurgCells)
    nonClassIIImaleCells(Xm).times = CAdurgCells(i).times;
    nonClassIIImaleCells(Xm).V = CAdurgCells(i).V;
    nonClassIIImaleCells(Xm).Cai = CAdurgCells(i).Cai;
    Xm = Xm+1;  
end

load('TestPop\nonClassIII\male\Flecainide\CAdrugPops.mat')
for i = 1:length(CAdurgCells)
    nonClassIIImaleCells(Xm).times = CAdurgCells(i).times;
    nonClassIIImaleCells(Xm).V = CAdurgCells(i).V;
    nonClassIIImaleCells(Xm).Cai = CAdurgCells(i).Cai;
    Xm = Xm+1;  
end

load('TestPop\nonClassIII\male\Disopyramide\CAdrugPops.mat')
for i = 1:length(CAdurgCells)
    nonClassIIImaleCells(Xm).times = CAdurgCells(i).times;
    nonClassIIImaleCells(Xm).V = CAdurgCells(i).V;
    nonClassIIImaleCells(Xm).Cai = CAdurgCells(i).Cai;
    Xm = Xm+1;  
end

load('TestPop\nonClassIII\male\Quinidine\CAdrugPops.mat')
for i = 1:length(CAdurgCells)
    nonClassIIImaleCells(Xm).times = CAdurgCells(i).times;
    nonClassIIImaleCells(Xm).V = CAdurgCells(i).V;
    nonClassIIImaleCells(Xm).Cai = CAdurgCells(i).Cai;
    Xm = Xm+1;  
end

% female
Xf = 1;
load('TestPop\nonClassIII\female\Digoxin\CAdrugPops.mat')
for i = 1:length(CAdurgCells)
    nonClassIIIfemaleCells(Xf).times = CAdurgCells(i).times;
    nonClassIIIfemaleCells(Xf).V = CAdurgCells(i).V;
    nonClassIIIfemaleCells(Xf).Cai = CAdurgCells(i).Cai;
    Xf = Xf+1;  
end

load('TestPop\nonClassIII\female\Quinidine\CAdrugPops.mat')
for i = 1:length(CAdurgCells)
    nonClassIIIfemaleCells(Xf).times = CAdurgCells(i).times;
    nonClassIIIfemaleCells(Xf).V = CAdurgCells(i).V;
    nonClassIIIfemaleCells(Xf).Cai = CAdurgCells(i).Cai;
    Xf = Xf+1;  
end

load('TestPop\nonClassIII\female\Propafenone\CAdrugPops.mat')
for i = 1:length(CAdurgCells)
    nonClassIIIfemaleCells(Xf).times = CAdurgCells(i).times;
    nonClassIIIfemaleCells(Xf).V = CAdurgCells(i).V;
    nonClassIIIfemaleCells(Xf).Cai = CAdurgCells(i).Cai;
    Xf = Xf+1;  
end

load('TestPop\nonClassIII\female\Ranolazine\CAdrugPops.mat')
for i = 1:length(CAdurgCells)
    nonClassIIIfemaleCells(Xf).times = CAdurgCells(i).times;
    nonClassIIIfemaleCells(Xf).V = CAdurgCells(i).V;
    nonClassIIIfemaleCells(Xf).Cai = CAdurgCells(i).Cai;
    Xf = Xf+1;  
end

load('TestPop\nonClassIII\female\Flecainide\CAdrugPops.mat')
for i = 1:length(CAdurgCells)
    nonClassIIIfemaleCells(Xf).times = CAdurgCells(i).times;
    nonClassIIIfemaleCells(Xf).V = CAdurgCells(i).V;
    nonClassIIIfemaleCells(Xf).Cai = CAdurgCells(i).Cai;
    Xf = Xf+1;  
end

load('TestPop\nonClassIII\female\Disopyramide\CAdrugPops.mat')
for i = 1:length(CAdurgCells)
    nonClassIIIfemaleCells(Xf).times = CAdurgCells(i).times;
    nonClassIIIfemaleCells(Xf).V = CAdurgCells(i).V;
    nonClassIIIfemaleCells(Xf).Cai = CAdurgCells(i).Cai;
    Xf = Xf+1;  
end


%% figure
c0 = [217/255,66/255,60/255];
ClassIIImaleCell = contain(ClassIIImaleCells);
ClassIIIfemaleCell = contain(ClassIIIfemaleCells);

c1 = [133/255,76/255,152/255];
nonClassIIImaleCell = contain(nonClassIIImaleCells);
nonClassIIIfemaleCell = contain(nonClassIIIfemaleCells);

%AP
figure
for jj = 1:5:length(ClassIIImaleCell)
   p10 = plot(ClassIIImaleCell(jj).times,ClassIIImaleCell(jj).V,'linewidth',0.3,'Color',c0);
    hold on
end
hold on
for j = 1:5:length(nonClassIIImaleCell)
   p11 = plot(nonClassIIImaleCell(j).times,nonClassIIImaleCell(j).V,'linewidth',0.3,'Color',c1);
    hold on
end
for jj = 1:5:length(ClassIIIfemaleCell)
   p10 = plot(ClassIIIfemaleCell(jj).times,ClassIIIfemaleCell(jj).V,'linewidth',0.3,'Color',c0);
    hold on
end
for jj = 1:5: length(nonClassIIIfemaleCell)
   p10 = plot(nonClassIIIfemaleCell(jj).times,nonClassIIIfemaleCell(jj).V,'linewidth',0.3,'Color',c0);
    hold on
    set(gca,'FontSize',6,'FontName','Calibri','linewidth',0.5,...
        'YLim',[-100 50],'YTick',[-100 -50 0 50],'XTick',[0 500 1000])
     % 关闭右边和上边的坐标轴线
    box off;
    %xlabel('Time (ms)','FontSize',10,'FontName','Calibri')
    %ylabel('Voltage (mV)','FontSize',10,'FontName','Calibri')
end

xlabel('Time (ms)','FontSize',6,'FontName','Calibri')
ylabel('Voltage (mV)','FontSize',6,'FontName','Calibri')
set(gcf,'Position',[219,161,448,392])
%picfile = fullfile('TestPop/', 'AFPopulation.png');
%saveas(gcf,picfile)
hold off
%}

% Cai
figure
for jj = 1:5:length(ClassIIImaleCell)
   p10 = plot(ClassIIImaleCell(jj).times,ClassIIImaleCell(jj).Cai,'linewidth',0.3,'Color',c0);
    hold on
end
hold on
for j = 1:5:length(nonClassIIImaleCell)
   p11 = plot(nonClassIIImaleCell(j).times,nonClassIIImaleCell(j).Cai,'linewidth',0.3,'Color',c1);
    hold on
end
for jj = 1:5:length(ClassIIIfemaleCell)
   p10 = plot(ClassIIIfemaleCell(jj).times,ClassIIIfemaleCell(jj).Cai,'linewidth',0.3,'Color',c0);
    hold on
end
for j = 1:5:length(nonClassIIIfemaleCell)
   p21 = plot(nonClassIIIfemaleCell(j).times,nonClassIIIfemaleCell(j).Cai,'linewidth',0.3,'Color',c1);
    hold on
    set(gca,'FontSize',6,'FontName','Calibri','linewidth',0.5,...
        'YLim',[0 800],'YTick',[0 200 400 600 800],'XTick',[0 500 1000])
     % 关闭右边和上边的坐标轴线
    box off;
    %xlabel('Time (ms)','FontSize',10,'FontName','Calibri')
    %ylabel('Cai (nM)','FontSize',10,'FontName','Calibri')
end

xlabel('Time (ms)','FontSize',6,'FontName','Calibri')
ylabel('Calcium Concentration(nM)','FontSize',6,'FontName','Calibri')
set(gcf,'Position',[219,161,448,392])
%picfile = fullfile('TestPop/', 'AFPopulation.png');
%saveas(gcf,picfile)
hold off
%}


%% csv 输出特征以用于使用python绘制特征分布小提琴图
% 输出代码在Table/S5中
disp('finish')


%% 函数
function DrugsCells = contain(classCell)
    n1 = 1;
    for i = 1:length(classCell)
        ti = classCell(i).times;
        Vi = classCell(i).V;
        Caii = classCell(i).Cai .* 1000000;
        [t,V,Cai] = splitdata(Vi,Caii,ti);%拆分
        for ii = 1:length(t)      
            if t(ii)<100      
                V(ii) = V(113);   
            end   
        end      
        DrugsCells(n1).times=t - 1000;     
        DrugsCells(n1).V=V;      
        DrugsCells(n1).Cai=Cai;     
        n1 = n1+1;   
    end
end

function [times,volts,cais] = splitdata(Vi,Caii,Ti)    
           PCL = 1000;
           i=fix(length(Ti)./PCL);
           intervals = find(~mod(Ti,PCL));%查找ti取模为0的地方
           times = Ti(intervals(i):intervals(i+1),1);%分离已模拟的细胞的时间数据，用以后续检查数据的正确与否
           volts = Vi(intervals(i):intervals(i+1),1);%分离已模拟的细胞的电压数据
           cais = Caii(intervals(i):intervals(i+1),1);        
end
