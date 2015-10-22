%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                           %
% twodheat.m                                                %
%  2lt david simeroth                                       %
%  created 20 oct 2015 :: last modified 20 oct 2015 by dls  %
%                                                           %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% assumes square two dimensional domain. solves steady-state 
% energy laplacian, d2tdx2+d2tdy2=0

% takes following inputs:
ndiv = input('Number of spatial divisions:  '); % in x and y
sigm = input('Residual threshold:           '); % 10^-(sigma)
maxn = input('Maximum number of iterations: '); % max loops
ttop = input('Temp of top of domain:        '); % t4
tbot = input('Temp of bottom of domain:     '); % t2
tlef = input('Temp of left of domain:       '); % t1
trig = input('Temp of right of domain:      '); % t3

% first, non-dimensionalize temperatures from 0-1:
tmin = min([ttop tbot tlef trig]); % min temp = offset
tnrm = max([ttop tbot tlef trig])-tmin; % difference = scale
tht1 = (tlef-tmin)/tnrm; % theta 1 (0-1 scale)
tht2 = (tbot-tmin)/tnrm; % theta 2 (0-1)
tht3 = (trig-tmin)/tnrm; % theta 3 (0-1)
tht4 = (ttop-tmin)/tnrm; % theta 4 (0-1)
tave = (tht1+tht2+tht3+tht4)/4; % average theta in domain

% next, build the initial domain:
tnew = tave*ones(ndiv+2); % build initial domain = ave
resn = tnew; % just opening this array to fill later
tnew(1,:)   = tht1; % boundary conditions (left)
tnew(:,1)   = tht2; % boundary conditions (bottom)
tnew(end,:) = tht3; % boundary conditions (right)
tnew(:,end) = tht4; % boundary conditions (top)

% i'll set the corners just to make the final picture pretty
tnew(1,1)     = (tht1+tht2)/2; % bottom left
tnew(end,1)   = (tht2+tht3)/2; % bottom right
tnew(end,end) = (tht3+tht4)/2; % top right
tnew(1,end)   = (tht4+tht1)/2; % top left

% now to the iterations:
for n=1:maxn % until we hit maximum number of iterations,
  told=tnew; % set the last time step as the old one
  for j=1:ndiv+2 % march through all the space (y)
  for i=1:ndiv+2 % march through all the space (x)
    tnew(i,j) = (told(i-1,j)+told(i,j-1)+...
	             told(i+1,j)+told(i,j+1))/4; % fde laplacian
	  resn(i,j) = (tnew(i,j)-told(i,j))^2 % residual
  end
  end
  res  = sqrt(sum(sum(resn))); % l2 norm residual (sqrt sqrd)
  if n==1 % normalize residuals against the first iteration
    res1 = res; % store the first iteration l2 norm residual
  end
  res = res/res1 % noramlize
  if res < 10^(-sigm) % if we've reached our threshold
    disp(['Convergence reached. Residual: ' num2str(res)])
	  disp(['Iterations: ' num2str(n)])
	  return % tell me and then quit
  end
end % if we haven't reached threshold, keep iterating

% if threshold never reached, tell me
disp(['Max iterations reached. Residual: ' num2str(res)])
disp(['Iterations: ' num2str(n)])
