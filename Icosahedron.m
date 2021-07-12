
% An icosahedron construction based on the vertices of three
% orthogonally-aligned golden ratio rectangles, creating 12 vertices.
% The order of the faces is shared with Wil O.C. Ward's "icosphere.m"
% function, so that further partions of run smoothly.

function [Points,Faces]=Icosahedron()

phi=(1+sqrt(5))/2; % Golden Ratio φ
 
A=[phi,phi,-phi,-phi]';
B=[-1,1,-1,1]';
C=[0,0,0,0]';

X=cat(1,B,C,A);
Y=cat(1,A,B,C);
Z=cat(1,C,A,B);

Points=cat(2,X,Y,Z);
Points=Points./norm(Points(1,:));

Faces=[01,12,06;
       01,06,02;
       01,02,08;
       01,08,11;
       01,11,12;
       02,06,10;
       06,12,05;
       12,11,03;
       11,08,07;
       08,02,09;
       04,10,05;
       04,05,03;
       04,03,07;
       04,07,09;
       04,09,10;
       05,10,06;
       03,05,12;
       07,03,11;
       09,07,08;
       10,09,02];
end