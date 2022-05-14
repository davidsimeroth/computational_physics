syms E1b J1p J2m E2b 
syms Q1p Q2m
syms R1ps R2ms R12r 
EQ1sp = Q1p == (E1b - J1p)/R1ps;
EQ12r = Q1p == (J1p - J2m)/R12r;
EQ21r = Q2m == (J2m - J1p)/R12r;
EQ2sm = Q2m == (E2b - J2m)/R2ms;

slveq = [EQ1sp Eq12r EQ21r EQ2sm];
slvmd = [J1p J2m];
slvtt = [Q1p slvmd Q2m];
slvqt = [E1b slvmd Q2m];
slvtq = [Q1p slvmd E2b];

[Q1ptt, J1ptt, J2mtt, Q2mtt] = ...
solve(slveq,slvtt);

[E1bqt, J1pqt, J2mqt, Q2mqt] = ...
solve(slveq,slvqt);

[Q1ptq, J1ptq, J2mtq, E2btq] = ...
solve(slveq,slvtq);