%% Universal Settings for Applying drugs 
clear
% cardiomyocyte settings
settings.celltype = 'endo'; % 'epi', 'endo', 'mid',
settings.PCL = 1000 ;  % Interval bewteen stimuli,[ms]
settings.stim_delay = 100 ; % Time the first stimulus, [ms]
settings.stim_dur = 5 ; % Stimulus duration
settings.stim_amp = 12.5; % Stimulus amplitude 

%settings.Folder = 'TestPop/ClassIII/male';
settings.Folder = 'TestPop/ClassIII/female';


%-- Apply Amiodarone 
settings.SubFolder = 'Amiodarone';
pert = settings_blockcurrents; 
pert.GNa = 1-0.29;
pert.Gto = 1-0.44;
pert.GKr = 1-0.40;
pert.GKs = 1-0.02;
pert.GNCX  = 1-0.37;
pert.GCaL = 1-0.54;
ApplyTrigger(settings,pert)
pause(25)


%-- Apply Dofetilide 
settings.SubFolder = 'Dofetilide';
pert = settings_blockcurrents; 
pert.GNa = SimulateDrug(2,380.5,0.9);
pert.GKr = SimulateDrug(2,4.9,0.9);
pert.GCaL = SimulateDrug(2,260.3,1.2);
pert.GNaL = SimulateDrug(2,753160.4,0.3);
pert.Gto = SimulateDrug(2,18.8,0.8);
pert.GK1 = SimulateDrug(2,394.3,0.8);

ApplyTrigger(settings,pert)
pause(25)

%-- Apply Dronedarone
settings.SubFolder = 'Dronedarone';
pert = settings_blockcurrents; 
pert.GNa = 1-0.12;
pert.GKr = 1-0.73;
pert.GKs = 1-0.16;
pert.GKur = 1-0.17;
pert.GCaL = 1-0.02;
ApplyTrigger(settings,pert)
pause(25)

%-- Apply Ibutilide 
settings.SubFolder = 'Ibutilide';
pert = settings_blockcurrents; 

pert.GKr = 1-0.45;
ApplyTrigger(settings,pert)
pause(25)


%-- Apply Sotalol 
settings.SubFolder = 'Sotalol';
pert = settings_blockcurrents; 
pert.GNa = SimulateDrug(14690,1140000000,0.5);
pert.Gto = SimulateDrug(14690,43143455,0.7);
pert.GKr = SimulateDrug(14690,110600,0.8);
pert.GKs = SimulateDrug(14690,4221856,1.2);
pert.GCaL = SimulateDrug(14690,7061527,0.9);
pert.GK1 = SimulateDrug(14690,3050260,1.2);
ApplyTrigger(settings,pert)
pause(25)
%}

%-- Apply Vernakalant 
settings.SubFolder = 'Vernakalant';
pert = settings_blockcurrents; 
pert.GNa = pert.GNa*(1-0.10);
pert.Gto = pert.Gto*(1-0.40);
pert.GKr = pert.GKr*(1-0.33);
pert.GKur = pert.GKur*(1-0.40);
pert.GCaL = pert.GCaL*(1-0.11);
ApplyTrigger(settings,pert)
pause(25)

disp('finished')

%% -- Drugs model Functions 
function Gi_drug = SimulateDrug(Drug,IC50i,hill)
    Gi_drug = 1/(1+(Drug/IC50i)^(hill));
end