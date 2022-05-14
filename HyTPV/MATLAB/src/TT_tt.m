% TT_tt

den = R12e*(R12r+R23r+R1ps+R2ms+R2ps+R3ms)+...
      R1ps*(     R23r+     R2ms+R2ps+R3ms);

Q1p = E1b*(R12e*(1-E3b/E1b)+R23r+R2ms+R3ms+R2ps)/den;
J1p = E1b - Q1p*R1ps;

W2e = J1p/R12e;
J2m = J1p - Q1p*R12r;
Q2m = W2e - Q1p;
E2b = J2m + Q2m*R2ms;
Q2p = -Q2m;
J2p = E2b - Q2p*R2ps;

W3e = J2p/R23e;
J3m = J2p - Q2p*R23r;
Q3m = W3e - Q2p;