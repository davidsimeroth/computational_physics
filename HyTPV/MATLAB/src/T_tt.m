% totalizer.m
% takes an emissivity spectrum and a temperature and produces a total,
% hemispherical emissivity.
function [Q_0,Q_z,W2e]=T_tt(l_1p,e_1p,l_2m,e_2m,l_2g,...
                            T_1,T_2)
                    

E_1b=@(lam) specEbb(T_1,lam);                    
eps_lp=@(lam) interp1(l_1p,e_1p,lam,'makima',min(e_1p));
R_1ps =@(lam) (1-eps_lp(lam))./eps_lp(lam);

R_12r=@(lam) 1.*lam./lam;
eta_2=@(lam) (lam<l_2g).*lam./l_2g;
R_12e=@(lam) 1./(eta_2(lam)+eps)./e_2p(lam);

eps_2m=@(lam) interp1(l_2m,e_2m,lam,'makima',min(e_2m));
R_2ms=@(lam) (1-eps_2m(lam))./eps_2m(lam);
E_2b=@(lam) specEbb(T_2,lam);

denom=@(lam) (R_12e(lam).*(R_1ps(lam)+R_2ms(lam)+R_12r(lam))+...
              R_1ps(lam).* R_2ms(lam));

Q_1=@(lam) (R_12e(lam).*(E_1b(lam)-E_2b(lam))+E_1b(lam).*R_2ms(lam))./denom(lam);
Q1=@(lam1,lam2) integral(@(lam)Q_1(lam),lam1,lam2);

W_2=@(lam) (E_1b(lam).*(R_12r(lam)+R_2ms(lam))+E_2b(lam).*R_1ps(lam))./denom(lam);
W2=@(lam1,lam2) integral(@(lam)W_2(lam),lam1,lam2);

Q_0=Q1(eps,1000);
W2e=W2(eps,1000);
Q_z=W2e-Q_0;