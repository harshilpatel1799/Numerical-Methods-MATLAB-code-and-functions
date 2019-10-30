%% USE MIDPOINT AND TRAPEZIOD QUADTURE TO CALCULATE ITEGRAND OVER 0 TO 70 WITH VARYING # OF INTERVALS
n=[3,8,51,501,5001,50001];
a=0;
b=70;
h=(b-a)./(n-1);
quadatureMid=zeros(1,size(n,2));
quadatureTrap=zeros(1,size(n,2));
for i=1:size(n,2)
    quadatureMid(i)=Midpoint(a,b,n(i));
    quadatureTrap(i)=Trapezoid(a,b,n(i));
end
%% USE EXACT VALUE TO CALCULATE ERROR % 
F70=1-exp(-0.01*70);
PctErrorMid=zeros(1,size(n,2));
PctErrorTrap=zeros(1,size(n,2));
for i=1:size(n,2)
    PctErrorMid(i)=abs((F70-quadatureMid(i))/(F70))*100;
    PctErrorTrap(i)=abs((F70-quadatureTrap(i))/(F70))*100;
end
%% PLOT PCTERROR
loglog(h,PctErrorMid,'ok-',h,PctErrorTrap,'^b--');
print -dpdf HW9_4.pdf