function [sx,sy,sz]=Plot_Sphere(x,y,z,R)
%this function use to plot Sphere Model
%[x,y,z] is the center of the Sphere
%R is Rdius of the Shpere
 [x1,y1,z1]=sphere;
 sx=x1*R+x;
 sy=y1*R+y;
 sz=z1*R+z;
