%% HW12 script to solve factory problem using MODIFIED Euler method.
%  Three functions are required:
%   1) f.m outputs "slope function" to IVP in standard form, dY/dt= f(t,Y)
%   2) ModEuler.m calculates the solution for Yi vs. ti using Heun's method.
%   3) Y_exact.m calculates the exact Y(t) from the analytic solution.  

%% FIX ALL xxx BELOW, AND REPLACE PLOT TITLES WITH SOMETHING APPROPRIATE.

% Set initial time, end time, and initial working machine count:
t0= 0;  tend= 60;   Y0= 20;

% Solve for Yi(ti) for three decreasing delta-ts:
[t1,Y1] = ModEuler(t0,tend,Y0,30);      % Delta-t = 30 days
[t2,Y2] = ModEuler(t0,tend,Y0,3);      % Delta-t1 = 3 days
[t3,Y3] = ModEuler(t0,tend,Y0,0.3);	% Delta-t = 0.3 days

%% Calculate Exact (analytic) solutions, and absolute errors.
% Since each time range above (t1,t2,t3) has different spacing and length,
%   we need to do this separately for each time range.
Y1x= Y_exact(t1);     Err1= abs(Y1x-Y1);
Y2x= Y_exact(t2);     Err2= abs(Y2x-Y2);
Y3x= Y_exact(t3);     Err3= abs(Y3x-Y3);

%% Make plot: Y(t)
plot(t3,Y3x,'--r', t1,Y1,'-ok', t2,Y2,'-b', t3,Y3,'-g')
 legend('Analytic','\Deltat = 30','\Deltat = 3','\Deltat = 0.3')
 grid on
xlabel('Time (days)')
ylabel('Machines in Operation')
title('FORECASTING NUMBER OF MACHINES IN OPERATION OVER 60 DAYS','Fontsize',16)
print -dpdf HW12a
disp('Hit a Key to Continue')
pause

%% Make plot: Error(t)
plot(t1,Err1,'-ok', t2,Err2,'-^b', t3,Err3,'-+g')
 legend('\Deltat = 30','\Deltat = 3','\Deltat = 0.3')
 grid on
xlabel('Time (days)')
ylabel('|| Error ||')
 set(gca,'fontsize',14)
title('FORECASTING NUMBER OF MACHINES IN OPERATION ERROR PLOT','Fontsize',16)
print -dpdf HW12b