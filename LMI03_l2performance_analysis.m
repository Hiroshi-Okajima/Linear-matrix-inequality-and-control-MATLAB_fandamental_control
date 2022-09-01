set(0,'DefaultAxesLinewidth',2,'DefaultLineLineWidth',2);
set(0,'defaultAxesFontSize',14);
set(0,'defaultAxesFontName','arial');
set(0,'defaultTextFontName','arial');
close all
clear
A = [0 1 0;0 0 1;-0.5 -1.2 -11.3];
B = [0;0;1];
C = [1 1 0];
setlmis([])
[gamma2,n,sgamma2] = lmivar(1,[1 1]);
[P,n,sP] = lmivar(1,[3 1]);
S1 = newlmi;
lmiterm([S1 1 1 P],1,A,'s')
lmiterm([S1 1 1 0],C'*C)
lmiterm([S1 1 2 P],1,B)
lmiterm([S1 2 2 gamma2],-1,1)
lmiterm([-S1 3 3 P],1,1)
LMIs = getlmis;
c = [1 0 0 0 0 0 0];
%[tmin,xopt] = feasp(LMIs);
[copt,xopt] = mincx(LMIs,c);
P1 = dec2mat(LMIs,xopt,P)
gamma21 = dec2mat(LMIs,xopt,gamma2)
gamma = sqrt(gamma21)
%P1*A+A'*P1+eye(3,3)
%eig(ans)