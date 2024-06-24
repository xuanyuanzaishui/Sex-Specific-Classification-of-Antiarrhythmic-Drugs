clear
%% Sensitivity Analyisis 
 load('TestPop\AFBasePop.mat') % AF population data
load('TestPop\AFPopFea.mat')


%% AF hotmap
disp('Sensitivity Analysis')
disp('----------------------------------------------------------------')
%load date
AF_conductances = AFpopscalings;
AF_features = AFBaseFea;
%map style
c=[18 104 131
   39 158 188
   144 201 230
   255 255 255
   144 201 230
   39 158 188
   18 104 131]/255;
N=256;
newmap=interp1(1:size(c),c,linspace(1,size(c,1),N),'linear');
%秩相关性
AF_rho=corr(AF_features,AF_conductances,'Type','Pearson');
%hot map
X1string_name={'RMP', 'dV/dtmax', 'APA', 'APD20', 'APD40', 'APD50',...
     'APD90','APDtri', 'CTA', 'CTmax', 'CTD50', 'CTD90', 'CTDtri', 'CTD'};
Y1string_name={'GNa','GNaL','Gto','GKr','GKs',...
    'GKur','GK1','GCaL','Gnak','Gncx','GpCa','Gup','Grel',...
    'Gleak'};
x1values = X1string_name;
y1values = Y1string_name;
h1 = heatmap(y1values,x1values,AF_rho,'FontSize',10, 'FontName','Calibri');
%h1.Title = 'Grandi AF';

h1.ColorLimits = [-1 1];
colormap(newmap);
saveas(gcf,sprintf('AFfeatureCorr.png'),'bmp'); %保存图片
%}

disp('----------------------------------------------------------------')