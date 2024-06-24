classdef popfuncs
    
    methods(Static)
%--------------------------------------------------------------------------
                      %% -- create_scale_vector.m -- %%
% Description: creates population variability scaling matrix.  

% Inputs:
% --> settings - [struct] simulation protocol settings    
% --> variations - [double array] number of members of the population 

% Outputs: 
% --> scaling_matrix - [double array] population variability scaling matrix
% -------------------------------------------------------------------------
        function scaling_matrix = create_scale_vector(settings,variations)                     
            [~,c] = model_parameters('endo');
            nG = length(fieldnames(c.G));
            
            scaling_matrix = exp(settings.sigmaG*randn(nG,variations))' ; % same parameter variation for each pop
           
        end 
               
%--------------------------------------------------------------------------
                 %% -- calibrate_experimental.m -- 
% Description:

% Inputs:
% --> settings - [struct] simulation protocol settings    
% --> Ti - [double array] time matrix 
% --> V - [double array] voltage matrix 

% Outputs: 
% --> times - [cell] time vector for each beat 
% --> volts - [cell] voltage vector for each beat  
%--------------------------------------------------------------------------
function calibrate = calibrate_experimental(settings,Xin,flage)
                X2=[];
                Y2=[];
            for ii = 1:length(Xin) %for each member of the population
                Xt = Xin(ii).times;
                XStates = Xin(ii).states;
            [times,volts,cais] = popfuncs.splitdata(Xt,XStates,settings); % saved the last 10 beats, separate each beat

                t = times{end};
                V = volts{end};
                Cai = cais{end} * 1000000;

                %%%预计修改位置
                outputs = calculate_features(V,Cai,t);%加载特征计算函数文件
                %{
                outs = num2cell(outputs,1);%数组转换为相同大小的元胞数组，1指取[列]
                [Vrest, ~, APA, APD20, ~, APD50, APD90,~,...
                 ~, ~, ~, ~, ~] =deal(outs{:});          
                %}
                Vrest = outputs.Vrest;       
                APA = outputs.APA;
                APD20 = outputs.APD20;
                APD50 = outputs.APD50;
                APD90 = outputs.APD90;
                upstrokes = outputs.Upstroke;
                if flage
                  I1 = Vrest > (-85) && Vrest < (-65);
                  I2 = APA > 75 && APA < 120;
                  I3 = APD20 > 1 && APD20 < 60;%定义误差范围，判断模拟数据是否正常
                  I4 = APD50 > 6 && APD50 < 200;
                  I5 = APD90 > 190 && APD90 < 440;
                  I6 = upstrokes > 40 && upstrokes < 420;
              
                  I = [I1,I2,I3,I4,I5,I6];
                  if all(I == 1)
                    X=Xin(ii);
                    X2 = [X2,X];
                  end

                else
                  J1 = Vrest > (-85) && Vrest < (-65);
                  J2 = APA > 80 && APA < 130;
                  J3 = APD20 > 1 && APD20 < 75;%定义误差范围，判断模拟数据是否正常
                  J4 = APD50 > 30 && APD50 < 180;
                  J5 = APD90 > 140 && APD90 < 330;
                  J6 = upstrokes > 40 && upstrokes < 420;

                  J = [J1,J2,J3,J4,J5,J6];
                   if all(J == 1)
                    Y=Xin(ii);
                    Y2 = [Y2,Y];
                   end
                end
            end
            if flage
                  calibrate=X2;
            else
                  calibrate=Y2;
            end
        end
%--------------------------------------------------------------------------
                      %% -- splitdata.m -- %%
% Description: When multiple beats of a single cell are simulated, this
% function separates each beat into its own cell array. This is used
% mainly when settings.numbertokeep is greater than 1. 

% Inputs:
% --> settings - [struct] simulation protocol settings    
% --> Ti - [double array] time matrix 
% --> V - [double array] voltage matrix 

% Outputs: 
% --> times - [cell] time vector for each beat 
% --> volts - [cell] voltage vector for each beat 
% -------------------------------------------------------------------------
        function [times,volts,cais] = splitdata(Ti,States,settings)   
            numberofAPs = settings.numbertokeep;
            PCL = settings.PCL;
            intervals = find(~mod(Ti,PCL));
            times = {};
            volts ={};
            cais = {};
            for i = 1:numberofAPs
                times{end+1} = Ti(intervals(i):intervals(i+1));%分离已模拟的细胞的时间数据，用以后续检查数据的正确与否
                volts{end+1} = States(intervals(i):intervals(i+1),39);%分离已模拟的细胞的电压数据
                cais{end+1} = States(intervals(i):intervals(i+1),38);%分离已模拟的细胞的钙离子数据
            end
        end
    end 
end
