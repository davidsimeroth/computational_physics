% SS_tq

Q1p = -Q3m;
E3b = E1b - Q3m*(R1ps + R12r + R2ms + R2ps + R23r + R3ms);

Q2m = Q3m;
Q2p = -Q3m;

J1p = E1b - Q3m*(R1ps);
J2m = E1b - Q3m*(R1ps + R12r);
E2b = E1b - Q3m*(R1ps + R12r + R2ms);
J2p = E1b - Q3m*(R1ps + R12r + R2ms + R2ps);
J3m = E1b - Q3m*(R1ps + R12r + R2ms + R2ps + R23r);
% E3b = E1b - Q3m*(R1ps + R12r + R2ms + R2ps + R23r + R3ms);