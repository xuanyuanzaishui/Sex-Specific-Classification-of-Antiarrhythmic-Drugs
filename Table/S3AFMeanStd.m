clear
%% 
load('TestPop\AF\male\AFfeaturesM.mat') 
load('TestPop\AF\female\AFfeaturesF.mat')


meanM = mean(AFfeaturesM);
stdM = std(AFfeaturesM);

meanf = mean(AFfeaturesF);
stdf = std(AFfeaturesF);

outAFMean_MF = [meanM;stdM;meanf;stdf];

%% 
Output_Dir = 'F:\PopDate\gender_Pop_github\Table\'; % path

outputlabels = {'RMP', 'dV/dtmax', 'APA', 'APD20', 'APD40', 'APD50',...
     'APD90','APDtri', 'CTA', 'CTmax', 'CTD50', 'CTD90', 'CTDtri', 'CTD'};%labels

Output_File = 'AFMean_MF.csv';

% mean and std of male 
outputFile(Output_Dir,Output_File,outAFMean_MF,outputlabels)

disp('finish')


%%
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