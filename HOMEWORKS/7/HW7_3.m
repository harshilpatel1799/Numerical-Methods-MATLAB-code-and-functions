%% Input Given Data
ti=[0 2 4 6 8 10 15 20]; %time in years data collected
Ri=[3 4 7 9 12 13 19 21]; %percent of cars needing repairs-data collected
tnew=0:20; % interpolation range
%% Interpolate Data 0-20 years with Exact Polynomial Method:
polynomialModel=polyval(polyfit(ti,Ri,size(ti,2)-1),tnew);
%% Interpolate Data 0-20 years with Linear Spline Method:
linearSpline=interp1(ti,Ri,tnew,'linear');
%% Interpolate Data 0-20 years with Cubic Spline Method:
cubicSpline=interp1(ti,Ri,tnew,'spline');
%% PLOT MODELS WITH COLLECTED DATA SUPER IMPOSED:
plot(ti,Ri,'ok',tnew,polynomialModel,'--r',tnew,linearSpline,'-k',tnew,cubicSpline,'-.b')
axis([0 20 0 25])
xlabel("t (time in years)")
ylabel("R (%)")
title("% of Cars Needing Repairs as Function of Time, Interpolations of Collected Data")
print -dpdf HW7_3_Plot.pdf;