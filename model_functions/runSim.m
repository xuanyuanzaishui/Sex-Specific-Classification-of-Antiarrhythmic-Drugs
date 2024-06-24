function datatable = runSim(settings,pert)
%% 1--- Load Model Parameters 
[p,c] = model_parameters(settings.celltype);

%% 2--- Load Model Initial Conditions of State Variables 
if ~isfield(settings,'ICs')
    y0 = ICs(settings.steady_state,settings.PCL);
    y0s = repmat(y0,settings.variations,1);   
else 
    y0s = settings.ICs;
end

%% 3--- Define Simulation Protocol 
stim_starts = settings.stim_delay + settings.PCL*(0:settings.nBeats-1) ;
stim_ends = stim_starts + settings.stim_dur ;

% Create intervals for each beat 
simints = 3*settings.nBeats ; %settings.nBeats
for i=1:settings.nBeats
    intervals(3*i-2,:) = [settings.PCL*(i-1),stim_starts(i)] ; %beginning 0-100
    intervals(3*i-1,:) = [stim_starts(i),stim_ends(i)] ; %stimulus 
    intervals(3*i,:) = [stim_ends(i),settings.PCL*i] ; % stimulus ends 105-1100
end
tend = settings.nBeats*settings.PCL ;              % end of simulation, ms
intervals(end,:) = [stim_ends(end),tend] ;

% Determine when to apply stim_amp or 0 amp 
Istim = zeros(simints,1) ;
stimindices = 3*(1:settings.nBeats) - 1 ; % apply stimulus on second part of intervals
Istim(stimindices) = settings.stim_amp ; 

%% 4--- Population Variables 
F_G = fieldnames(c.G);
S = settings.scalings;

%% 5--- Define Perturbation Protocol 
[p,c]= perturbations(c,p,pert);  
baselineparameters = c;

%% 6--- Run Loop 
for ii=1:settings.variations    
    scaling = S(ii,:);          
    c = scaling_factors(scaling,baselineparameters,F_G); 
    statevar_i = y0s(ii,:);     
    options = odeset('RelTol',1e-5,'MaxStep',1);
    
    % stimulate cell
    t = 0 ;
    statevars = statevar_i ;
    for i=1:simints            
        [post,posstatevars] = ode15s(@dydt_Grandi,intervals(i,:),statevar_i,options,Istim(i),p,c);
         
        t = [t;post(2:end)] ;
        statevars = [statevars;posstatevars(2:end,:)];
        statevar_i = posstatevars(end,:);
    end 
    % Only save the number of beats specified in numbertokeep
    start = find( t == intervals(simints-3*settings.numbertokeep+1,1));
    t_final = t(start:end);    
    statevars_final = statevars(start:end,:);%---
    conductances = stc2double(c);

    datatable(ii).times =  t_final - min(t_final);
     datatable(ii).states = statevars_final;
    datatable(ii).scalings = scaling;
    datatable(ii).conductances = conductances;
                               
end

%% Nested Functions 
function [p,c]= perturbations(c,p,pert)
    c.G.GNa  = c.G.GNa * pert.GNa;
    c.G.GNaL = c.G.GNaL * pert.GNaL;
    c.G.Gto  = c.G.Gto * pert.Gto;
    c.G.GKr = c.G.GKr * pert.GKr;
    c.G.GKs = c.G.GKs * pert.GKs;
    c.G.GKur = c.G.GKur * pert.GKur;
    c.G.GK1  = c.G.GK1 * pert.GK1;
    c.G.GCaL = c.G.GCaL * pert.GCaL;
    c.G.Pnak = c.G.Pnak * pert.NaK;
    c.G.Gncx = c.G.Gncx * pert.GNCX;
    c.G.GpCa = c.G.GpCa * pert.GpCa;
    c.G.Rel   = c.G.Rel * pert.Rel ;
    c.G.SERCA = c.G.SERCA * pert.SERCA ;
    c.G.Leak  = c.G.Leak * pert.Leak;

    % protocols
    p.Ko = p.Ko * pert.Ko;
    p.Inject = pert.Inject;
    p.Cao = p.Cao * pert.Cao;
    p.Nao = p.Nao * pert.Nao;

function c = scaling_factors(scaling,baselineparameters,n_G)
    scalings.G = scaling(1:length(n_G));
    for iF = 1:length(n_G)
        aF = n_G{iF};
        c.G.(aF) = baselineparameters.G.(aF) * scalings.G(iF);
    end 

function conductances = stc2double(c)
    GNa  = c.G.GNa ;
    GNaL = c.G.GNaL ;
    Gto  = c.G.Gto ;
    GKr = c.G.GKr ;
    GKs = c.G.GKs ;
    GKur = c.G.GKur;
    GK1  = c.G.GK1;
    GCaL = c.G.GCaL;
    Pnak = c.G.Pnak;
    Gncx = c.G.Gncx;
    GpCa = c.G.GpCa;
    Rel   = c.G.Rel;
    SERCA = c.G.SERCA;
    Leak  = c.G.Leak ;
  conductances = [GNa GNaL Gto GKr GKs GKur GK1 GCaL Pnak Gncx GpCa Rel SERCA Leak];