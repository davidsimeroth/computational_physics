% T_tt
den = R12e*(R1ps+R2ms+R12r)+R1ps*R2ms;

Q1p = (R12e*(E1b - E2b)+E1b*R2ms)/den;
W2e = (E1b*R2ms+E2b*R1ps+E1b*R12r)/den;

Q2m = (E1b*(R12r-R12e)+E2b*(R1ps+R12e))/den;
J1p = R12e*(E1b*(R2ms+R12r)+E2b*R1ps)/den;
J2m = (E1b*R2ms*(R12e-R12r)+E2b*R12e*(R1ps+R12r))/den;