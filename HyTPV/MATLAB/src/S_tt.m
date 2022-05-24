% totalizer.m
% takes an emissivity spectrum and a temperature and produces a total,
% hemispherical emissivity.
function [Q_0,Q_z]=S_tt(l_1p,e_1p,l_2m,e_2m,T_1,T_2)
eps_l=@(lam) interp1(l_1p,e_1p,lam,'makima',min(e_1p));

eps_2=@(lam) interp1(l_2m,e_2m,lam,'makima',min(e_2m));

R_1ps=@(lam) (1-eps_l(lam))./eps_l(lam);

R_12r=@(lam) 1.*lam./lam;

R_2ms=@(lam) (1-eps_2(lam))./eps_2(lam);

E_1b=@(lam) specEbb(T_1,lam);

E_2b=@(lam) specEbb(T_2,lam);

denom=@(lam) (R_1ps(lam)+R_12r(lam)+R_2ms(lam));

Q_1=@(lam) (E_1b(lam)-E_2b(lam))./denom(lam);

Q1=@(lam1,lam2) integral(@(lam)Q_1(lam),lam1,lam2);

Q_0=Q1(eps,1000);

% Q_2=@(lam) (E_2b(lam)-E_1b(lam))./denom(lam);

% Q2=@(lam1,lam2) integral(@(lam)Q_2(lam),lam1,lam2);

Q_z=-Q_0;

% W_w=@(lam) (E_1b(lam).*(R_12r(lam)+R_2ms(lam))+E_2b(lam).*R_1ps(lam))...
%     ./denom(lam);

% W=@(lam1,lam2) integral(@(lam)W_w(lam),lam1,lam2);

% W_total=W(eps,100);