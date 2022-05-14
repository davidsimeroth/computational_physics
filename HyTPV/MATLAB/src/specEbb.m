function ebblam=specEbb(T,lamb,varargin)
if nargin==2
    n=1;
elseif nargin==3
    n=varargin{1};
else
    error('Invalid inputs! Expecting "specEbb(T,lamb)" or "specEbb(T,lamb,n)".')
end
lamb=lamb*1e-6; %wavelength, lamb (mum->m)
kb=1.380649e-23; %Boltzmann's constant, k (J/K)
h=6.62607015e-34; %Planck's constant, h (J s)
co=299792458; %speed of light in a vacuum, c_o (m/s)
c1=2*pi*h*co^2; %constant group 1, C_1 (W/m^2)
c2=h*co/kb; %constant group 2, C_2 (m K)
ebblam=c1./n.^2./lamb.^5./(exp(c2./n./lamb./T)-1); %spectral emissive power, E_b_lamb (W/m^2/m)
ebblam=ebblam/1e6; %spectral emissive power -> W/m^2/mu m
end