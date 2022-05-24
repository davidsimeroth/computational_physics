%% SETUP
% Let's say we have an internal temperature requirement of T_int < 500K
% We want to find the internal heat rejection required to sustain 500K if
% we have an external temperature from 500:1500K
T_int = 300:50:1000; % K, internal temperature constraint
T_ext = 1000;        % K, external temperature boundary conditions

%% S DRIVE
% Now we will determine the heat transfer into the surface, and,
% separately, into the vehicle interior for a static skin (exterior
% radiating into the vehicle). Let's assume that our skin is a CMC, like
% CSIC, and our internals are mounted on an alumninum alloy frame

cd ./Materials
pullsi
pullcsic
cd ../
Qi_S = T_int.*0;
Qe_S = Qi_S;

for tt = 1:length(T_int)
    [Qe_S(tt),Qi_S(tt)] = S_tt(l_csic,e_csic,l_si,e_si,T_ext,T_int(tt));
end

plot(T_int,Qe_S)

%% T DRIVE
% That was neat! Now let's say we had this radiating to a TPV cell on the
% interior, first

cd ./Materials
pullsi
cd ../

e_g = 1.1;
l_g = 1.23/e_g;

Qi_T = T_int.*0;
Qe_T = Qi_T;
W1_T = Qe_T;

for tt = 1:length(T_int)
    [Qe_T(tt),Qi_T(tt),W1_T(tt)] = T_tt(l_csic,e_csic,l_si,e_si,l_g,T_ext,T_int(tt));
end

plot(T_int,Qe_S,T_int,Qi_T,T_int,W1_T)