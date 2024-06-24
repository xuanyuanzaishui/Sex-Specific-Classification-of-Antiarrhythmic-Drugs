function sPop = Popdata(popICs,popscalings,pert)
%Run Population using final steady state ICs 
% Inputs:
% --> popICs - Model Initial Conditions of State Variables
% --> popscalings - [struct] [double array] population variability scaling matrix

% Outputs: 
% sPop - Generate population data with new steady state ICs.
% -------------------------------------------------------------------------
settings2.celltype = 'endo';
settings2.PCL = 1000 ;  % Pacing, Interval bewteen stimuli,[ms]
settings2.stim_delay = 100 ; % Time the first stimulus, [ms]
settings2.stim_dur = 5 ; % Stimulus duration
settings2.stim_amp = 12.5 ; % Stimulus amplitude 
settings2.nBeats = 2 ; % Only one beat
settings2.numbertokeep = 2 ;% Save only that one beat
settings2.ICs = popICs;
settings2.scalings = popscalings;
settings2.variations = size(popscalings,1);

% Run each cell in population with new steady state ICs 
sPop = runSim(settings2,pert); % run simulation

