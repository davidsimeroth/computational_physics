% SS_tt

Q1p = (E1b - E3b)/(R1ps + R12r + R2ms + R2ps + R23r + R3ms);
Q3m = (E3b - E1b)/(R1ps + R12r + R2ms + R2ps + R23r + R3ms);

Q2p = Q1p;
Q2m = Q3m;

J1p = E1b - Q1p*R1ps;
J2m = J1p - Q1p*R12r;
E2b = J2m - Q1p*R2ms;
J2p = E2b - Q1p*R2ps;
J3m = J2p - Q1p*R23r;