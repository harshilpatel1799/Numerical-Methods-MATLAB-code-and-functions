%%%%%%%%%%%%%%%%% Numerical Methods Homework Problem 5.4 %%%%%%%%%%%%%%%%%
% DO NOT change this main script!!  Use it exactly as it is!!
%
% YOU need to make the function Jacobi.m to interface with this script
% to create the needed outputs which allow the plots at the end to be made.

%% Specify Characteristics of Heated Rod
clear
M= 201;         % Number of points along cable to calculate Y(x)

L= 10;          % Distance between supports (m)
a= 2;           % Physical characteristic of cable (see problem)
YL= 20;         % Height of cable at Left suport, (m)
YR= 15;         % Height of cable at Right support, (m)
tolX= 1e-8 * sqrt(M);   % Convergence tolerance for "proxy error in X"
tolR= 1e-8 * sqrt(M);   % Convergence tolerance for residual error

%% Run YOUR Jacobi Iterative Method
[Yhistory, ErrorX, ErrorR, Iter]= Jacobi(L, a, YL, YR, M, tolX, tolR);

%% Create "exact" solution for plotting
x= linspace(0,L,M)';        % M points (x) along cable, from x=0 to x=L

C= (2*L+YR-YL)/(exp(L/2/a)-1);
Yexact= C*exp(x/2/a) - 2*x + YL-C;                % Analytic solution Y(x)

%% Plot Y(x) from Jacobi Iteration vs. Analytic Result
% Plot lines for k=1, 100, 1000, 10000 and final ("end") iterations.
% Exact (analyic) solution will overlay in green o symbols.
subplot(121);
plot(x,Yexact,'og', x,Yhistory(:,[1 100 1000 10000 end]), 'linewidth',2)
  grid on; axis([0 10 0 20])
  xlabel('x (meters)'); ylabel('Height (meters)')
  title('Height Profiles During Convergence')
  legend('Exact','1st','100th','1000th','10000th','Final',...
      'Location','southwest')

%% Plot convergence history: "proxy" error and residual error vs k
% "Proxy" for error in Y is BLUE, residual error is RED.
subplot(122)
plot([1:Iter],log10(ErrorX),'-b', [1:Iter],log10(ErrorR),'--r')
  grid on
  xlabel('Iteration (k)'); ylabel('log_1_0(Error)  (L_2 norm)')
  title(['Convergence History, Final k = ' num2str(Iter)])
  legend('Proxy Error in Y', 'Residual Error')
