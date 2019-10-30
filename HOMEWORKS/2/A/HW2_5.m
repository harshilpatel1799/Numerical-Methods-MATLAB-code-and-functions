% To analyze the properties of computer computation and its error caused by computers approximating the derivative,
% Consider the function f(x)=x^2 @x=300, and its dertive f'(x)=200x. This script compare	
% the approximate value of the derivatve from the limit form of def. of the derivative to the exact value of f’(300) = 600,
% by testing smaller-and-smaller values of a, and looking at the errors.
% HW2_5.m,uses function deriv.m to calculate vectors of the parameters:
% (a, deriv(a), absolute value of “error”, absolute value of “% relative error”),using the vector a.
% In this script “error” is defined as the absolute difference between deriv(a) and the exact value of 600, while only being positive .

a=10.^-(0:18); % creates vector a that is inputted as elements of a gets smaller and smaller.
fprime=deriv(a); % vector of derivative @ x=300 with certain a in limit def. of derative. 
Error=abs(600-deriv(a)); % vector of absolute value of “error”. 
PctError=Error/600; % absolute value of “% relative error”.

%make two plots: the approximate derivative, log10 of the percent relative error, both	
%as a function of the base-10 logarithm of a:	
subplot(211); plot(log10(a), fprime, '-o')
    xlabel('log_1_0(a)'); ylabel('Approx Derivative')
subplot(212); plot(log10(a), log10(PctError),'-o')
    xlabel('log_1_0(a)'); ylabel('log_1_0(|% Error|)') 
print('-dpdf','PLOT2_5.pdf')
