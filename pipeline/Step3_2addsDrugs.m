%% Universal Settings for Applying drugs 

% cardiomyocyte settings
settings.celltype = 'endo'; % 'epi', 'endo', 'mid',
settings.PCL = 1000 ;  % Interval bewteen stimuli,[ms]
settings.stim_delay = 100 ; % Time the first stimulus, [ms]
settings.stim_dur = 5 ; % Stimulus duration
settings.stim_amp = 12.5; % Stimulus amplitude 

%settings.Folder = 'TestPop/nonClassIII/male';
settings.Folder = 'TestPop/nonClassIII/female';

%
%-- Apply Propafenone 
settings.SubFolder = 'Propafenone';
pert = settings_blockcurrents; 
pert.GNa = 1-0.24;
pert.Gto = 1-0.10;
pert.GKr = 1-0.65;
pert.GKs = 1-0.05;
pert.GCaL = 1-0.34;
ApplyTrigger(settings,pert)
pause(25)

%-- Apply Ranolazine 
settings.SubFolder = 'Ranolazine';
pert = settings_blockcurrents; 
pert.GNa = pert.GNa*(1-0.05);
pert.GKr = pert.GKr*(1-0.45);
pert.GKs = pert.GKs*(1-0.09);
pert.GNCX  = pert.GNCX * (1-0.10);
pert.GCaL = pert.GCaL*(1-0.04);
ApplyTrigger(settings,pert)
pause(25)


%-- Apply Flecainide 
settings.SubFolder = 'Flecainide';
pert = settings_blockcurrents; 
pert.GNa = 1-0.28;
pert.Gto = 1-0.25;
pert.GKur = 1-0.46;
pert.GK1 = 1-0.61;
pert.GCaL = 1-0.08;
ApplyTrigger(settings,pert)
pause(25)

%-- Apply Digoxin 
settings.SubFolder = 'Digoxin';
pert = settings_blockcurrents; 
pert.GKs = 1-0.48;
pert.NaK = 1-0.29;
ApplyTrigger(settings,pert)


%-- Apply Disopyramide 
settings.SubFolder = 'Disopyramide';
pert = settings_blockcurrents; 
pert.GNa = SimulateDrug(742,168400,1);
pert.GKr = SimulateDrug(742,14400,1);
pert.GCaL = SimulateDrug(742,1036700,1);
ApplyTrigger(settings,pert)
pause(25)

%-- Apply Quinidine 
settings.SubFolder = 'Quinidine';
pert = settings_blockcurrents; 
pert.GNa = SimulateDrug(3237,12329,1.5);
pert.Gto = SimulateDrug(3237,3487.4,1.3);
pert.GKr = SimulateDrug(3237,992,0.8);
pert.GNaL = SimulateDrug(3237,9417,1.3);
pert.GCaL = SimulateDrug(3237,51592.3,0.6);
pert.GK1 = SimulateDrug(3237,39589919,0.4);
pert.GKs = SimulateDrug(3237,4898.9,1.4);
ApplyTrigger(settings,pert)
pause(25)

%}

%% -- Drugs model Functions 
function Gi_drug = SimulateDrug(Drug,IC50i,hill)
    Gi_drug = 1/(1+(Drug/IC50i)^(hill));
end