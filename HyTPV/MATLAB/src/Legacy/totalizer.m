% totalizer.m
% takes an emissivity spectrum and a temperature and produces a total,
% hemispherical emissivity.
function e=totalizer(l_in,e_in,T_in)
e_l=@(lambda) interp1(l_in,e_in,lambda,'makima',min(e_in));

E_bTl=@(T,lambda) specEbb(T,lambda);

E_Tl=@(T,lambda) e_l(lambda).*E_bTl(T,lambda);

E_bT=@(T,lambda1,lambda2) integral(@(lambda)E_bTl(T,lambda),lambda1,lambda2);

E_T=@(T,lambda1,lambda2) integral(@(lambda)E_Tl(T,lambda),lambda1,lambda2);

e_t=@(T,lambda1,lambda2) E_T(T,lambda1,lambda2)./E_bT(T,lambda1,lambda2);

e=e_t(T_in,0,10000);