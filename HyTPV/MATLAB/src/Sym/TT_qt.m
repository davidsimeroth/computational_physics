% TT_qt

den = R12e + R23r + R2ms + R2ps + R3ms;

E1b = R12e*(E3b+Q1p*(R12r+R23r+R2ms+R1ps+R2ps+ ...
          R1ps/R12e*(R23r+R2ms+R3ms+R2ps)))/den;      
J1p = E1b - Q1p*R1ps;

W2e = J1p/R12e;
Q2m = W2e - Q1p;
J2m = J1p - Q1p*R12r;
E2b = J2m + Q2m*R2ms;
Q2p = -Q2m;
J2p = E2b - Q2p*R2ps;

W3e = J2p/R23e;
Q3m = W3e - Q2p;
J3m = J2p + Q3m*R23r;