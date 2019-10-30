%% USE MIDPOINT AND TRAPEZIOD QUADTURE TO CALCULATE ITEGRAND OVER 0 TO 70 WITH VARYING # OF INTERVALS
n=[2,8,50,500,5000,50000];
a=0;
b=70;
h=(b-a)./(n-1);
quadatureMid=zeros(1,size(n,2));
quadatureTrap=zeros(1,size(n,2));
quadatureSimp=zeros(1,size(n,2)-1);
for i=1:size(n,2)
    quadatureMid(i)=Midpoint(a,b,n(i));
    quadatureTrap(i)=Trapezoid(a,b,n(i));
end
for i=1:(size(n,2)-1)
    quadatureSimp(i)=Simpson(a,b,n(i+1));
end
%% USE EXACT VALUE TO CALCULATE ERROR % 
F70=1-exp(-0.01*70);
PctErrorMid=zeros(1,size(n,2));
PctErrorTrap=zeros(1,size(n,2));
PctErrorSimp=zeros(1,size(n,2)-1);
for i=1:size(n,2)
    PctErrorMid(i)=abs((F70-quadatureMid(i))/(F70))*100;
    PctErrorTrap(i)=abs((F70-quadatureTrap(i))/(F70))*100;
end
for i=1:(size(n,2)-1)
    PctErrorSimp(i)=abs((F70-quadatureSimp(i))/(F70))*100;
end
%% PLOT PCTERROR
loglog(h,PctErrorMid,'ok-',h,PctErrorTrap,'^g--',h(1,2:size(n,2)),PctErrorSimp,'sb-.');
print -dpdf HW10_4.pdf
%% built-in function integral to solve for F(70) directly (using the Fun.m for f(x))
X=integral(@Fun,a,b);