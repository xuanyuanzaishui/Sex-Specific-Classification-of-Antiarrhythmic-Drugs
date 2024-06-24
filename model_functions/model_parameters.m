function [p,c] = model_parameters(celltype)
p.celltype = celltype;
p.Inject = 0;
p.Nao=140.0;
p.Cao=1.8;
p.Ko=5.4;

%physical constants
p.R=8314.0;
p.T=310.0;
p.F=96485.0;
p.Cm=1.1e-10; %uF

%cell geometry
p.L=0.01;
p.rad=0.0011;
p.vcell=1000*3.14*p.rad*p.rad*p.L;
p.Ageo=2*3.14*p.rad*p.rad+2*3.14*p.rad*p.L;
p.Acap=2*p.Ageo;
p.vmyo=0.68*p.vcell;
p.vnsr=0.0552*p.vcell;
p.vjsr=0.0048*p.vcell;
p.vss=0.02*p.vcell;

%jsr constants
p.bt=4.75;
p.a_rel=0.5*p.bt;

% channel conductances通道电导 
c.G.GNa=23;   %(130)
c.G.GNaL=0.0025; %(244)
%c.G.PNab=0.597e-3; %(131)
%c.G.GKp=0.002; %(138)
c.G.Gto=0.165; %(341)
c.G.GKr=0.035; %(273)
c.G.GKs=0.0035; %(291)
c.G.GKur=0.045; %(363)
c.G.GK1=0.0525; %(384)
c.G.GCaL=2.7e-4;%(147)
%c.G.PCab=6.0643e-4;%(163)
c.G.Pnak=1.0; %(132)
c.G.Gncx=3.15; %(152)
c.G.GpCa=0.0471;%(161)
c.G.SERCA = 1 ;%(456)
c.G.Leak = 1;%(457)
c.G.Rel = 1;

end
