% pullemiss.m
% loads spectral emissivity of oxidized aluminum
% nickel, and titanium into the workspace
%
% data taken from:
% "radiative emissivity of metals and oxidized metals at high temps"
% George Teodorescu
% dissertation
% auburn university
% august 4 2007
% https://etd.auburn.edu/bitstream/handle/10415/1395/TEODORESCU_GEORGE_46.pdf?sequence=1
ni = [1.0113141862489115, 0.4212389380530973;
1.4986945169712786, 0.3491150442477876;
1.9982593559617055, 0.3048672566371682;
2.4978241949521327, 0.27345132743362827;
2.9852045256745012, 0.24159292035398228;
3.4969538729329854, 0.21592920353982292;
3.9965187119234113, 0.18761061946902674;
4.483899042645778, 0.17123893805309737;
4.983463881636203, 0.15663716814159284;
5.519582245430808, 0.13141592920353978;
6.006962576153175, 0.1123893805309733;
6.506527415143603, 0.10442477876106221;
7.0060922541340265, 0.0973451327433629;
7.493472584856395, 0.0889380530973452;
7.99303742384682, 0.08274336283185857;
8.492602262837252, 0.07654867256637171;
8.992167101827675, 0.07477876106194697;
9.4917319408181, 0.07345132743362848;
9.991296779808527, 0.07035398230088491;
10.490861618798956, 0.06814159292035399;
10.99042645778938, 0.06504424778761064;
11.47780678851175, 0.06327433628318602;
11.98955613577023, 0.060176991150442616;
12.476936466492596, 0.05884955752212406;
12.988685813751085, 0.0575221238938054;
13.488250652741511, 0.055752212389380496;
13.987815491731938, 0.054424778761062054;
14.487380330722361, 0.053539823008849685;
14.974760661444732, 0.05221238938053102;
15.486510008703211, 0.05088495575221258;
15.998259355961702, 0.04911504424778773];
l_ni=ni(:,1);
e_ni=ni(:,2);
clear ni