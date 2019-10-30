%DOLLHEAD.m by  Harshil Patel 1/11/2019
%DOLLHEAD.m-A systems-engineering assessment of a doll-head making machine has determined that the 
%daily productionon of heads can be modeled by the equation P=(10*s)-(((s/(2e6))*(exp(s/30)))*((t-1)^2)).
%where 
%• P is the number of doll heads produced on day t, production is always P= 0 or greater on given day.
%• t is the day of operation (starting at day t = 1 when production by machine starts to day t=1200 for this analysis), 
%• s is the machine setting that is increased in 5% intervals(%percent of max operation, between s= 0  off and  s=100 = max operation),

s=transpose(0:5:100); % a column vector s of all machine settings from s=0 to s=100, skipping by 5
t=1:1200; % a vector t of days from 1 to 1200
P=(10.*s)-(((s./(2e6)).*(exp(s./30))).*((t-1).^2)); % vectorized computation of matrix of P(t)-production quantity for given day with diffret machine setting s.

% P as production quantity can be any number ≥ 0. Given P vector may have created negative elements due to being a mathematical model, 
%those negative elements have to adjusted to P=0 or as no production quantity for given day. 
for i=1:size(P,1)
    for j=1:size(P,2)
        if P(i,j)<0
            P(i,j)=0; % replace negative values of vector P with 0.
        end
    end
end

%Makes a plot of all 21 P(t)(production quantity as  function of time measured in days) 
%lines with varying machine settings as a variable, 
%one for each setting of vector s, This is on top of each other in one graph. 
for i=1:size(P,1) %
    plot(t,P(i,:),'black');
    hold on %keeps plots on all same figure.
end
xlabel('t (day)')
ylabel('P (units produced)')
title({'Daily Rate of Head Production P(t)','For Varying Machine Setting'})
hold off
print -dpdf DHplot.pdf


% Create Vector called TOTAL , for which each elements in TOTAL represents the total production quantity of doll heads over 
%the 1200 day life in vector t- for each for each machine setting s in vector s.
total=1:(size(P,1));
for i=1:size(P,1)
    total(i)=sum(P(i,:));
end
TOTAL=total';
[M,I] = max(TOTAL); % variable I is saved as index of max quantity of doll head in TOTAL vector.
%Automated way to analyze vectors s and TOTAL 
%to figure out which value of the setting s produced the maximum number of doll heads over 1200 day time period.
optimal=s(I); %finds corresponding machine setting of max quantity of doll head from I from TOTAL vector.
fprintf('HW1.5: The optimal setting for s is %1.0f',optimal)

