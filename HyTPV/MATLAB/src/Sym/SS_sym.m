syms E1b J1p J2m E2b J2p J3m E3b
syms Q1p Q2m Q2p Q3m 
syms R1ps R2ms R2ps R3ms R12r R23r
EQ1sp = Q1p == (E1b - J1p)/R1ps;
EQ12r = Q1p == (J1p - J2m)/R12r;
EQ21r = Q2m == (J2m - J1p)/R12r;
EQ2sm = Q2m == (E2b - J2m)/R2ms;
EQ22q = Q2m + Q2p;
EQ2sp = Q2p == (E2b - J2p)/R2ps;
EQ23r = Q2p == (J2p - J3m)/R23r;
EQ32r = Q3m == (J3m - J2p)/R23r;
EQ3sm = Q3m == (E3b - J3m)/R3ms;

slveq = [EQ1sp EQ12r EQ21r EQ2sm EQ22q EQ2sp EQ23r EQ32r EQ3sm];
slvmd = [J1p J2m Q2m E2b Q2p J2p J3m];
slvtt = [Q1p slvmd Q3m];
slvqt = [E1b slvmd Q3m];
slvtq = [Q1p slvmd E3b];

[Q1ptt, J1ptt, J2mtt, Q2mtt, E2btt, Q2ptt, J2ptt, J3mtt, Q3mtt] = ...
solve(slveq,slvtt);

[E1bqt, J1pqt, J2mqt, Q2mqt, E2bqt, Q2pqt, J2pqt, J3mqt, Q3mqt] = ...
solve(slveq,slvqt);

[Q1ptq, J1ptq, J2mtq, Q2mtq, E2btq, Q2ptq, J2ptq, J3mtq, E3btq] = ...
solve(slveq,slvtq);