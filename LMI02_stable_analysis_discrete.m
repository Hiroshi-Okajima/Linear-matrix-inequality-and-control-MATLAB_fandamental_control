set(0,'DefaultAxesLinewidth',2,'DefaultLineLineWidth',2);
set(0,'defaultAxesFontSize',14);
set(0,'defaultAxesFontName','arial');
set(0,'defaultTextFontName','arial');
close all
clear
A = [0 1 0;0 0 1;-0.5 -0.4 -0.3];
B = [0;0;1];
C = [1 1 0];
setlmis([])
[P,n,sP] = lmivar(1,[3 1]);
S1 = newlmi;
lmiterm([S1 1 1 P],A',A)
lmiterm([S1 1 1 P],-1,1)
lmiterm([S1 1 1 0],eye(3,3))
lmiterm([-S1 2 2 P],1,1)
LMIs = getlmis;
c = [1 0 0 0 0 0];
%[tmin,xopt] = feasp(LMIs);
[copt,xopt] = mincx(LMIs,c);
P1 = dec2mat(LMIs,xopt,P)
%A'*P1*A-P1+eye(3,3)
%eig(ans)