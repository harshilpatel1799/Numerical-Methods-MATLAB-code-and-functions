%% 1ST ORDER POLYNOMIAL
P1=polyfit(t,y,1);
A1=polyval(P1,t);
residuals1=y-A1;
sigma=sum((y-mean(y)).^2);
Rsqaured1=1-((norm(residuals1,2)^2)/sigma);
%% 2nd ORDER POLYNOMIAL
P2=polyfit(t,y,2);
A2=polyval(P2,t);
residuals2=y-A2;
Rsqaured2=1-((norm(residuals2,2)^2)/sigma);
%% PLOTS
plot(t,y,"o",t,A1,"b",t,A2,"r")
print -dpdf PLOT6A.pdf
plot(t,residuals2,"o",t,0*t,"r")
print -dpdf PLOT6B.pdf