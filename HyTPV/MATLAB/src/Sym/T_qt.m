% T_qt
den = (R12e+R2ms);

E1b = R12e*(E2b+Q1p*(R12r+R1ps+R2ms*(1+R1ps/R12e)))/den;
W2e = (E2b+Q1p*(R12r+R2ms))/den;
Q2m = (E2b+Q1p*(R12r-R12e))/den;

J1p = R12e*(E2b+Q1p*(R12r+R2ms))/den;
J2m = R12e*(E2b+Q1p*(R2ms-R12r*R2ms/R12e))/den;