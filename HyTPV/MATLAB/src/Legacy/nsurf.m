syms Q_1 Q_2 Q_3
assume (Q_1>0)
assume (Q_2>0)
assume (Q_3>0)
syms     W_2 W_3
syms E_1 E_2 E_3
syms J1m J2m 
syms     J2p J3p
% syms     J2v J3v
syms e1m e2m
syms     e2p e3p
syms     et2 et3

R1m = 1/e1m-1;
R2m = 1/e2m-1;
R2p = 1/e2p-1;
R3p = 1/e3p-1;

R1q = 1;
R2q = 1;
R1w = 1/et2/e2p;
R2w = 1/et3/e3p;

em1 = Q_1*R1m == E_1-J1m;
em2 = Q_2*R2m == E_2-J2m;

ep1 = Q_2*R2p == J2p-E_2;
ep2 = Q_3*R3p == J3p-E_3;

ex1 = Q_2*R1q == J1m-J2p;
ex2 = Q_3*R2q == J2m-J3p;

ef1 = W_2*R1w == J1m;
ef2 = W_3*R2w == J2m;

ec1 = Q_1 == Q_2 + W_2;
ec2 = Q_2 == Q_3 + W_3;

% copy pasta below, remove known quantities from solve/result lists
% [Q_1,Q_2,Q_3,W_2,W_3,E_1,E_2,E_3,J1m,J2m,J2p,J3p] = ...
%                       solve([em1,em2,ep1,ep2,ex1,ex2,ef1,ef2,ec1,ec2] , ...
%                             [Q_1,Q_2,Q_3,W_2,W_3,E_1,E_2,E_3,J1m,J2m,J2p,J3p]);

% Q1,Q3 known (Clean)
% [Q_2,W_2,W_3,E_1,E_2,E_3,J1m,J2m,J2p,J3p] = ...
%                       solve([em1,em2,ep1,ep2,ex1,ex2,ef1,ef2,ec1,ec2] , ...
%                             [Q_2,W_2,W_3,E_1,E_2,E_3,J1m,J2m,J2p,J3p]);

% E1,E3 known (Messy)
% [Q_1,Q_2,Q_3,W_2,W_3,E_2,J1m,J2m,J2p,J3p] = ...
%                       solve([em1,em2,ep1,ep2,ex1,ex2,ef1,ef2,ec1,ec2] , ...
%                             [Q_1,Q_2,Q_3,W_2,W_3,E_2,J1m,J2m,J2p,J3p]);

% Q1,E3 known (Slightly less messy)
% [Q_2,Q_3,W_2,W_3,E_1,E_2,J1m,J2m,J2p,J3p] = ...
%                       solve([em1,em2,ep1,ep2,ex1,ex2,ef1,ef2,ec1,ec2] , ...
%                             [Q_2,Q_3,W_2,W_3,E_1,E_2,J1m,J2m,J2p,J3p]);

% E1,Q3 known (Very messy)
% [Q_1,Q_2,W_2,W_3,E_2,E_3,J1m,J2m,J2p,J3p] = ...
%                       solve([em1,em2,ep1,ep2,ex1,ex2,ef1,ef2,ec1,ec2] , ...
%                             [Q_1,Q_2,W_2,W_3,E_2,E_3,J1m,J2m,J2p,J3p]);

% E1,Q1 known (Long, but appears to have a pattern)
% [Q_2,Q_3,W_2,W_3,E_2,E_3,J1m,J2m,J2p,J3p] = ...
%                       solve([em1,em2,ep1,ep2,ex1,ex2,ef1,ef2,ec1,ec2] , ...
%                             [Q_2,Q_3,W_2,W_3,E_2,E_3,J1m,J2m,J2p,J3p]);

% E3,Q3 known (Only slightly messy)
[Q_1,Q_2,W_2,W_3,E_1,E_2,J1m,J2m,J2p,J3p] = ...
                      solve([em1,em2,ep1,ep2,ex1,ex2,ef1,ef2,ec1,ec2] , ...
                            [Q_1,Q_2,W_2,W_3,E_1,E_2,J1m,J2m,J2p,J3p]);

Wtt = W_2 + W_3;

pretty(simplify(Wtt));