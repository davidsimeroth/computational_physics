% T_tq
den = (R12e+R1ps);

Q1p = (E1b-Q2m*R12e)/den;
W2e = (E1b+Q2m*R1ps)/den;

E2b = (E1b*(R12e-R12r)+Q2m*(R12e*(R12r+R1ps+R2ms)+R1ps*R2ms))/den;
Q2m = (E1b*(R12r-R12e)+E2b*(R1ps+R12e))/den;

J1p = R12e*(E1b+E2b*R1ps)/den;
J2m = (E1b*(R12e-R12r)+Q2m*R12e*(R1ps+R12r))/den;