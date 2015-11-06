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
//main program
int main (int argc, char *argv[]){
 // constants:
 const double pi {3.1415926}; //because i don't like typing this out
 bool tb {false}, qb {false}; //until i know otherwise, i don't this info
 int row=0, i, j, tt, qq, xx, yy, zz, nn; //row,node,cell, and qvar index
 double az, el, caz, cel, eps, beta; //azimuth, elevation, emissivity, and view
 struct ray {float x, y, z;} n, c, p, q; //view, cell, normals and p, q
 float a, tave; //cell area, ave temp
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
   while (getline (dat,line)) 
   {
    ++row
    if (row==1);
    else if (row==2)
    {
     line = line + " "
     nn = count(line) - 2;
     xx = find
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
   // inputs:
   cout << 'Azimuth of observer (degrees):' << endl;
   cout << '0 = nose, 90 = right wing, -90 = left wing' << endl;
   cin >> az;
   az = az * pi / 180;
   cout << endl << 'Elevation of observer (degrees):' << endl;
   cout << '0 = nose, 90 = top-down, -90 = bottom-up' << endl;
   cin >> el;
   el = el * pi / 180;
   // calculations:
   n.z = sin(el); // spherical normals
   n.y = cos(el) * sin(az); 
   n.x = cos(el) * cos(az);
   // READ IN STUFF
   // I want to read everything after the last variable; this contains
   // the information about the connectivity of the cells.
   x=in(1:i); // If all data is read in a single column; x-coord of nodes
   y=in(i+1:2*i); // y-coord of nodes
   z=in(2*i+1:3*i); // z-coord of nodes
   tray=in((tt-1)*i+1:tt*i); // translational temperature of nodes
   // open these arrays
   for k=1:j
    // area nonsense
    p.x = x(cells(1,k)) - x(cells(2,k));
    p.y = y(cells(1,k)) - y(cells(2,k));
    p.z = z(cells(1,k))-z(cells(2,k));
    q.x = x(cells(1,k))-x(cells(3,k));
    q.y = y(cells(1,k))-y(cells(3,k));
    q.z = z(cells(1,k))-z(cells(3,k));
    c.x = p.y * q.z - p.z * q.y; //x normal of face
    c.y = p.z * q.x - p.x * q.z; //y normal of face
    c.z = p.x * q.y - p.y * q.x; //z normal of face
    a = sqrt(c.x * c.x + c.y * c.y + c.z * c.z); //area of face
    c = c / a; //normalized norms
    cel = asin(cz); //cell elevation
    caz = asin(cy / cos(cel); //cell azimuth
    beta = acos(fabs(n.x * c.x + n.y * c.y + n.z * c.z));
    if (fabs(cel - el) >= pi / 2. || abs(caz - az) >= pi / 2. )
     rad(k)=0;
    else
     t=(tray(cells(1,k))+tray(cells(2,k)+tray(cells(3,k)))/3;
     qq=eps*sig*t^4;
     rad(k)=cos(beta)*a*qq;
   radtot=sum(rad);
   // fin
  }
 }
 return 0;
}
//rad subroutine for blackbody emission
float rad(float t, double eps){
 const float sig {5.670367e-8}; //W/m^2/K^4
 float q;
 q = eps * sig * pow(t,4);
 return q;
}
//simple subroutine for counting spaces
int count(const string input, int n{0}){
 int nspace {0};
 for (int i = n; i < input.size(); ++i){
  if (input[i] == ' ') ++nspace;
 }
 return nspace;
}
