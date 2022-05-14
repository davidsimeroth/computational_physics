syms E1b J1p J2m E2b 
syms Q1p W2e Q2m
syms R1ps R2ms R12r R12e
EQ1sp = Q1p == (E1b - J1p)/R1ps;
EQ12r = Q1p == (J1p - J2m)/R12r;
EQ12e = W2e == (J1p - 000)/R12e;
EQ21r = W2e == (Q1p + Q2m);
EQ2sm = Q2m == (E2b - J2m)/R2ms;

slveq = [EQ1sp EQ12r EQ12e EQ21r EQ2sm];
slvmd = [J1p J2m W2e];
slvtt = [Q1p slvmd Q2m];
slvqt = [E1b slvmd Q2m];
slvtq = [Q1p slvmd E2b];
slvqq = [E1b slvmd E2b];

[Q1ptt, J1ptt, J2mtt, W2ett, Q2mtt] = ...
solve(slveq,slvtt);

[E1bqt, J1pqt, J2mqt, W2eqt, Q2mqt] = ...
solve(slveq,slvqt);

[Q1ptq, J1ptq, J2mtq, W2etq, E2btq] = ...
solve(slveq,slvtq);

[E1bqq, J1pqq, J2mqq, W2eqq, E2bqq] = ...
solve(slveq,slvqq);