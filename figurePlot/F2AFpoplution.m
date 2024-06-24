clear

%% 将AF绘制在一张图上
load('TestPop\AF\male\AFpopm7.mat') 
load('TestPop\AF\male\AFfeaturesm7.mat') 
load('TestPop\AF\female\AFpopf7.mat')
load('TestPop\AF\female\AFfeaturesf7.mat')
Xa = 1;
for i = 1:length(AFBaseCellsm)
    AFBasecell(Xa).times = AFBaseCellsm(i).times;
    AFBasecell(Xa).V = AFBaseCellsm(i).V;
    AFBasecell(Xa).Cai = AFBaseCellsm(i).Cai;
    Xa = Xa+1;
end
for i = 1:length(AFBaseCellsf)
    AFBasecell(Xa).times = AFBaseCellsf(i).times;
    AFBasecell(Xa).V = AFBaseCellsf(i).V;
    AFBasecell(Xa).Cai = AFBaseCellsf(i).Cai;
    Xa = Xa+1;
end
c0 = [213 196 170]/255; %color map
n1 = 1;
for i = 1:length(AFBasecell)
    t = AFBasecell(i).times;
    V = AFBasecell(i).V;
    Cai = AFBasecell(i).Cai .* 1000000;
    for ii = 1:length(t)
        t = t - t(1);
        if t(ii)<57
            V(ii) = V(57); 
        end
    end      
    AFBaseCells1(n1).times=t;     
    AFBaseCells1(n1).V=V;      
    AFBaseCells1(n1).Cai=Cai;     
    n1 = n1+1;   
end

% AP
%
figure
for jj = 1:length(AFBasecell)
   p2 = plot(AFBaseCells1(jj).times,AFBaseCells1(jj).V,'linewidth',0.3,'Color',c0);
    hold on
    set(gca,'FontSize',6,'FontName','Calibri','linewidth',0.5,...
        'YLim',[-100 50],'YTick',[-100 -50 0 50],'XLim',[0 1000],'XTick',[0 500 1000])
     % 关闭右边和上边的坐标轴线
    box off;
    %xlabel('Time (ms)','FontSize',10,'FontName','Calibri')
    %ylabel('Voltage (mV)','FontSize',10,'FontName','Calibri')
end

xlabel('Time (ms)','FontSize',6,'FontName','Calibri')
ylabel('Voltage (mV)','FontSize',6,'FontName','Calibri')
set(gcf,'Position',[219,161,448,392])
%picfile = fullfile('TestPop1/', 'AFPopulation.png');
%saveas(gcf,picfile)
hold off
%

% Cai
figure
for jj = 1:length(AFBasecell)
   p2 = plot(AFBaseCells1(jj).times,AFBaseCells1(jj).Cai,'linewidth',0.3,'Color',c0);
    hold on
    set(gca,'FontSize',6,'FontName','Calibri','linewidth',0.5,...
        'YLim',[100 400],'YTick',[100 200 300 400],'XLim',[0 1000],'XTick',[0 500 1000])
     % 关闭右边和上边的坐标轴线
    box off;
    %xlabel('Time (ms)','FontSize',10,'FontName','Calibri')
    %ylabel('Voltage (mV)','FontSize',10,'FontName','Calibri')
end

xlabel('Time (ms)','FontSize',6,'FontName','Calibri')
ylabel('Calcium Concentration(nM)','FontSize',6,'FontName','Calibri')
set(gcf,'Position',[219,161,448,392])
%picfile = fullfile('TestPop1/', 'AFPopulation.png');
%saveas(gcf,picfile)
hold off
%}

%% csv 输出AF特征以用于使用python绘制特征分布小提琴图
Output_Dir = 'F:\PopDate\gender_Pop_github\Table\'; % path

outputlabels = {'RMP', 'dV/dtmax', 'APA', 'APD20', 'APD40', 'APD50',...
     'APD90','APDtri', 'CTA', 'CTmax', 'CTD50', 'CTD90', 'CTDtri', 'CTD','Gender','class'};%labels

Output_File = 'AFfeatures.csv';

AFfeaturesm(:,3) = AFfeaturesm(:,3) - 20;
AFfeaturesf(:,3) = AFfeaturesf(:,3) - 20;
AFfeaturesm(:,15) = 0;
AFfeaturesf(:,15) = 1;

% all
AFfeature = [AFfeaturesm;AFfeaturesf];
AFfeature(:,16) = 1;
outputFile(Output_Dir,Output_File,AFfeature,outputlabels)

%male
Output_File = 'AFfeaturesm.csv';
AFfeaturesm(:,3) = AFfeaturesm(:,3) - 20;
outputFile(Output_Dir,Output_File,AFfeaturesm,outputlabels)

%female
Output_File = 'AFfeaturesf.csv';
AFfeaturesf(:,3) = AFfeaturesf(:,3) - 20;
outputFile(Output_Dir,Output_File,AFfeaturesf,outputlabels)

disp('finish')




%% 函数
%
 function [times,volts,cais] = splitdata(Vi,Caii,Ti)   
            
            PCL = 1000;
            i=fix(length(Ti)./PCL);
            intervals = find(~mod(Ti,PCL));%查找ti取模为0的地方
            times = Ti(intervals(i):intervals(i+1),1);%分离已模拟的细胞的时间数据，用以后续检查数据的正确与否
            volts = Vi(intervals(i):intervals(i+1),1);%分离已模拟的细胞的电压数据
            cais = Caii(intervals(i):intervals(i+1),1);
           
 end

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