function hetot=totlEbb(T,varargin)
if nargin==1
    n=1;
elseif nargin==2
    n=varargin{1};
else
    error('Invalid inputs! Expecting "totlEbb(T)" or "totlEbb(T,n)".')
end
sig=5.67e-8; %stefan boltzmann constant, sigma (W/m^2/K^4)
hetot=n.^2*sig*T.^4; %total hemispherical emissive power