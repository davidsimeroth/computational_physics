% totalizer.m
% takes an emissivity spectrum and a temperature and produces a total,
% hemispherical emissivity.
function [Q_0,Q_z,W2e]=TS_tt(l_1p,e_1p,l_2m,e_2m,l_2g,...
                             l_2p,e_2p,l_3m,e_3m,...
                             T_1,T_3)
                    

E_1b=@(lam) specEbb(T_1,lam);                    
eps_lp=@(lam) interp1(l_1p,e_1p,lam,'makima',min(e_1p));
R_1ps =@(lam) (1-eps_lp(lam))./eps_lp(lam);

R_12r=@(lam) 1.*lam./lam;
eta_2=@(lam) (lam<l_2g).*lam./l_2g;
R_12e=@(lam) 1./(eta_2(lam)+eps)./e_2p(lam);

eps_2m=@(lam) interp1(l_2m,e_2m,lam,'makima',min(e_2m));
R_2ms=@(lam) (1-eps_2m(lam))./eps_2m(lam);
% E_2b=@(lam) specEbb(T_2,lam);                    
eps_2p=@(lam) interp1(l_2p,e_2p,lam,'makima',min(e_2p));
R_2ps =@(lam) (1-eps_2p(lam))./eps_2p(lam);

R_23r=@(lam) 1.*lam./lam;
% eta_3=@(lam) (lam<l_3g).*lam./l_3g;
% R_23e=@(lam) 1./(eta_3(lam)+eps)./e_3p(lam);

eps_3m=@(lam) interp1(l_3m,e_3m,lam,'makima',min(e_3m));
R_3ms=@(lam) (1-eps_3m(lam))./eps_3m(lam);
E_3b=@(lam) specEbb(T_3,lam);

denom=@(lam) (R_12e(lam).*(R_1ps(lam)+R_2ms(lam)+R_12r(lam)+...
                           R_2ps(lam)+R_3ms(lam)+R_23r(lam))+...
              R_1ps(lam).*(           R_2ms(lam)           +...
                           R_2ps(lam)+R_3ms(lam)+R_23r(lam)));

Q_1=@(lam) (E_1b(lam).*(R_12e(lam).*(1-E_3b(lam)./E_1b(lam))+R_2ms(lam)+...
                        R_2ps(lam)+R_23r(lam)+R_3ms(lam)))./denom(lam);
    

Q1=@(lam1,lam2) integral(@(lam)Q_1(lam),lam1,lam2);

Q_0=Q1(eps,1000);

% Q_2=@(lam) (E_2b(lam)-E_1b(lam))./denom(lam);

% Q2=@(lam1,lam2) integral(@(lam)Q_2(lam),lam1,lam2);

Q_z=-Q_0;

% W_w=@(lam) (E_1b(lam).*(R_12r(lam)+R_2ms(lam))+E_2b(lam).*R_1ps(lam))...
%     ./denom(lam);

% W=@(lam1,lam2) integral(@(lam)W_w(lam),lam1,lam2);

% W_total=W(eps,100);