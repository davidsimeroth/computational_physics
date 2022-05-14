% TS_qt

den = R12e + R23r + R2ms + R3ms + R2ps;

Q3m = (E3b - Q1p*(R12e + R12r))/den;
J3m = E3b - Q3m*R3ms;

J2p = J3m - Q3m*R23r;
Q2p = -Q3m;
E2b = J2p + Q2p*R2ps;
Q2m = -Q2p;
J2m = E2b - Q2m*R2ms;

J1p = J2m + Q1p*R12r;
E1b = J1p + Q1p*R1ps;

W2e = J1p/R12e;
