% totalizer.m
% takes an emissivity spectrum and a temperature and produces a total,
% hemispherical emissivity.
function [Q_aero,Q_vehicle,W_total]=twotalizer(l_1em,e_1em,l_2pv,e_2pv,l_gap,T_internal,T_aero)
e_le=@(lam) interp1(l_1em,e_1em,lam,'makima',min(e_1em));

e_2p=@(lam) interp1(l_2pv,e_2pv,lam,'makima',min(e_2pv));

R_1se=@(lam) (1-e_le(lam))./e_le(lam);

R12h=@(lam) 1.*lam./lam;

eta=@(lam) (lam<l_gap).*lam./l_gap;

R12e=@(lam) 1./(eta(lam)+eps)./e_2p(lam);

R_2sp=@(lam) (1-e_2p(lam))./e_2p(lam);

E_1=@(lam) specEbb(T_aero,lam);

E_2=@(lam) specEbb(T_internal,lam);

denom=@(lam) (R_1se(lam).*(R12e(lam)+R12h(lam)+R_2sp(lam))+...
              R12e(lam).*(R12h(lam)+R_2sp(lam)));

Q_1=@(lam) (E_1(lam).*(R12e(lam)+R12h(lam)+R_2sp(lam))-E_2(lam).*R12e(lam))...
    ./denom(lam);

Q1=@(lam1,lam2) integral(@(lam)Q_1(lam),lam1,lam2);

Q_aero=Q1(eps,1000);

Q_2=@(lam) (E_1(lam).*R12e(lam)-E_2(lam).*(R_1se(lam)+R12e(lam)))...
    ./denom(lam);

Q2=@(lam1,lam2) integral(@(lam)Q_2(lam),lam1,lam2);

Q_vehicle=Q2(eps,100);

W_w=@(lam) (E_1(lam).*(R12h(lam)+R_2sp(lam))+E_2(lam).*R_1se(lam))...
    ./denom(lam);

W=@(lam1,lam2) integral(@(lam)W_w(lam),lam1,lam2);

W_total=W(eps,100);