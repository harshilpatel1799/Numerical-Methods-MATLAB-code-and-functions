%%%%%%%%%%%%%%%%  Numerical Methods Homework Problem 3.7 %%%%%%%%%%%%%%%%

% This code calculates the root of a heat transfer equation f(T)=0 using
% your own bisection method. Then the code uses the MATLAB function FZERO
% to get a "professional" answer, to compare to your own result.
% 
% THIS IS JUST THE INITIAL CODE FRAGMENT. YOU NEED TO COMPLETE THE SCRIPT.
% ADD ADDITIONAL DOCUMENTATION HERE.

%% INITIALIZATION OF VARIABLES FOR THE BISECTION METHOD
clear

% Initial Guess Tk, and start the "T_history" vector of iterations Tk
a = 0;              % Left-side bracket (a = "T1")
b = 100;            % Right-side bracket (b = "T2")
T_history = [a b];  % Will save each Tk as element in vector T_history

% Tolerances (NEED TO REPLACE 0 PLACEHOLDERS)
tol_x = 10*eps*abs(b-a);  % "Proxy" error Tol
tol_f = 10*eps*max(abs(pavement(b)),abs(pavement(a)));  % Residual Tol

%% PART [C]: MAKE A PLOT ... just to make sure [a,b] is a valid bracket
t=a:b;
fT=pavement(t);
plot(t,fT,t,zeros(1,size(t,2)));
print -dpdf Plot_of_pavement
%% PART [D]: ITERATIONS FOR THE BISECTION METHOD

% Be sure to use a while loop, which continues iterating until BOTH
% convergence criteria ("proxy" AND "residual" error) are satisfied.

% You'll need to call pavement(Tk) here somehow to get f(Tk) at each
% each iteration.

% Keep adding the latest iteration of temperature to the end of the vector
% of "T_history"

iteration_count=0;
Tk=(b+a)/2;
while (abs(b-a)>tol_x) && (abs(pavement(Tk))>tol_f)
    iteration_count=iteration_count+1;
    T_history(iteration_count+2)=Tk;
    if (pavement(Tk)>=0) && (pavement(a)>=0)
        a=Tk;
    else 
        b=Tk;
    end
        Tk=(b+a)/2;      
end
T_root=Tk;
%% PART [E]: "EXACT" SOLUTION (using FZERO), and PLOT OF "REAL" ERROR 

% Calculate "real" solution using fzero, with same initial bracket [0,100]
% Make sure you use "options" to activate showing iterations.


% Calculate "real" error for all the (saved) Tk iterations in T_history
% assuming T_Matlab is the "exact" solution


% Plot the log10(error) vs. iteration k (convergence plot)

options=optimset("Display", "iter");
T_Matlab=fzero('pavement',[0,100],options);
eK=abs(T_Matlab-T_history);
plot(1:size(eK,2),log10(eK))
xlabel('Iterations'); ylabel('log_1_0(True Error)') 
print -dpdf PLOT3_7.pdf

%% ANSWERS: 
disp("a.) final (converged) value for temperature T is "+Tk+", taking "+iteration_count+" iterations.");
disp("b.) From 'fzero', true T is "+T_Matlab+", taking 8 iterations.");