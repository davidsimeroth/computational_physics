/*
 rad
  not 2lt simeroth's master's thesis
  written  4 nov 15
  modified 6 nov 15 (dls; still getting started)

 takes ASCII boundary surface output from fun3d and calcs
 emission observed from a given azimuth and elevation, 
 wavelength bands. */
#include <iostream>
#include <fstream>
#include <string>
#include <cmath>

using namespace std;

int main ( int argc, char *argv[] ) 
{
 // constants:
 const double pi {3.1415926}; //because i don't like typing this out
 bool tb {false}, qb {false}; //until i know otherwise, i don't this info
 int row=0, i, j, tt, qq, xx, yy, zz, nn; //row,node,cell, and qvar index
 double az, el, eps; //azimuth, elevation, and emissivity
 struct ray {float x, y, z;} n, c, p, q; //view, cell, normals and p, q
 float tave; //cell ave temp
 float * xn, yn, zn, tn, qn; //arrays for x, y, z, t, and q
 string line; //for incoming lines

 if (argc != 2 && argc != 3) // make sure they gave me a file to work with 
  cout << 'Usage: ' << argv[0] << ' <boundary file> [<band file>]' << endl;
 else 
 {
  ifstream dat (argv[1]);
  if (!dat.is_open()) cout << 'Error opening file!' << endl;
  else 
  {
   // inputs:
   cout << 'Azimuth of observer (degrees):' << endl;
   cout << '0 = nose, 90 = right wing, -90 = left wing' << endl;
   cin >> az;
   az=az*pi/180;
   cout << endl << 'Elevation of observer (degrees):' << endl;
   cout << '0 = nose, 90 = top-down, -90 = bottom-up' << endl;
   cin >> el;
   el=el*pi/180;
   while (getline (dat,line))
   {
    if (row==0) row=row+1;
    if (row==1)
    {
     nn = count(line)-1;
     
	}
   }
   dat.close();
   //qn=input('number of variables in output'); % TO BE READ FROM HEADER
   //i =input('number of points in output');    % ""
   //j =input('number of cells in output');     % THIS TOO
   //tt=input('variable represennting tt');   % AND THIS
   // if you get around to it, check for presence of at least t or q
   // if both, calc eps. If just one, ask for eps.
   cout << endl << 'Average emissivity' << endl; // ave surface emissivity for radiation
   cin >> eps;
   cout << endl << 'Mirrored? (0=no,1=yes)' << endl; // if mirrored, extra logic
   cin >> mirror;
   // hopefully at some point, this will be automated.
   // calculations:
   nz=sin(el); % spherical normals
   ny=cos(el)*sin(az); 
   nx=cos(el)*cos(az);
   // READ IN STUFF
   cells=resize(in(qn*i:end),4,[]); % Not sure if this is the right syntax
   // I want to read everything after the last variable; this contains
   // the information about the connectivity of the cells.
   x=in(1:i); // If all data is read in a single column; x-coord of nodes
   y=in(i+1:2*i); // y-coord of nodes
   z=in(2*i+1:3*i); // z-coord of nodes
   tray=in((tt-1)*i+1:tt*i); // translational temperature of nodes
   // open these arrays
   for k=1:j
    // area nonsense
    p(1)=x(cells(1,k))-x(cells(2,k));
    p(2)=y(cells(1,k))-y(cells(2,k));
    p(3)=z(cells(1,k))-z(cells(2,k));
    q(1)=x(cells(1,k))-x(cells(3,k));
    q(2)=y(cells(1,k))-y(cells(3,k));
    q(3)=z(cells(1,k))-z(cells(3,k));
    cx=p(2)*q(3)-p(3)*q(2); % x normal of face
    cy=p(3)*q(1)-p(1)*q(3); % y normal of face
    cz=p(1)*q(2)-p(2)*q(1); % z normal of face
    a=sqrt(cx^2+cy^2+cz^2); % area of face
    cx=cx/a; % normalized norms
    cy=cy/a;
    cz=cz/a;
    cel=asin(cz); % cell elevation
    caz=asin(cy/cos(cel); % cell azimuth
    beta=acos(abs(nx*cx+ny*cy+nz+cz));
    if (abs(cel-el)>=pi/2)
     rad(k)=0;
    elseif (abs(caz-az)>=90)
     rad(k)=0;
    else
     %average t
     t=(tray(cells(1,k))+tray(cells(2,k)+tray(cells(3,k)))/3;
     qq=eps*sig*t^4;
     rad(k)=cos(beta)*a*qq;
    end
   end
   radtot=sum(rad);
   // fin
  }
 }
 return 0;
}
// rad subroutine
float rad(float t, double eps)
{
 const float sig {5.670367e-8}; //W/m^2/K^4
 float q;
 q = eps*sig*pow(t,4e0);
 return q;
}
// simple program for counting inputs based off of spaces
int count( const string input, int n{0} )
{
 int nspace = 0;
 for (int i = n; i < input.size(); ++i)
 {
  if (input[i] == ' ') ++nspace;
 }
 return nspace;
}
