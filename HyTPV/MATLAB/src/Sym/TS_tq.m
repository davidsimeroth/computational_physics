% TS_tq

Q1p = (E1b - Q3m*R12e)/(R12e + R1ps);
J1p = E1b - Q1p*R1ps;

W2e = J1p/R12e;

J2m = J1p - Q1p*R12r;
Q2m = W2e - Q1p;
E2b = J2m + Q2m*R2ms;
Q2p = -Q2m;
J2p = E2b - Q2p*R2ps;

J3m = J2p + Q3m*R23r;
E3b = J3m + Q3m*R3ms;