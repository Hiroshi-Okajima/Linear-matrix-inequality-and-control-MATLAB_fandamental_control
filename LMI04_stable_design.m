set(0,'DefaultAxesLinewidth',2,'DefaultLineLineWidth',2);
set(0,'defaultAxesFontSize',14);
set(0,'defaultAxesFontName','arial');
set(0,'defaultTextFontName','arial');
close all
clear
A = [0 1 0;0 0 1;2 -1.2 2.3];
B = [0;0;1];
B2 = [5;1;-2];
C = [-1 5 0];
setlmis([])
[gamma,n,sgamma] = lmivar(1,[1 1]);
[P,n,sP] = lmivar(1,[3 1]);
[Z,n,sZ] = lmivar(2,[1 3]);
S1 = newlmi;
lmiterm([S1 1 1 P],1,A','s')
lmiterm([S1 1 1 Z],-B,1,'s')
lmiterm([S1 1 2 0],B2)
lmiterm([S1 1 3 P],1,C')
lmiterm([S1 2 2 gamma],-1,1)
lmiterm([S1 3 3 gamma],-1,1)
lmiterm([-S1 4 4 P],1,1)
LMIs = getlmis;
c = [1 0 0 0 0 0 0 0 0 0];
%[tmin,xopt] = feasp(LMIs);
[copt,xopt] = mincx(LMIs,c);
P1 = dec2mat(LMIs,xopt,P)
Z1 = dec2mat(LMIs,xopt,Z)
gamma1 = dec2mat(LMIs,xopt,gamma)
K = Z1*inv(P1)
eig(A - B*K)