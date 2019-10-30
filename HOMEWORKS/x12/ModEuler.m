function [t,Y]= ModEuler(t0,tend,Y0,dt)
% Implement MODIFIED Euler method to solve the IVP: dY/dt = f(t,Y)
%   over range t=[t0,tend] with increment dt,
%   and initial condition X=Y0 at t=t0.
t=t0:dt:tend;
Y=zeros(size(t));
Y(1)=Y0;
for i=1:size(t,2)-1 % finds all Y in range t1 to tend using method
K1=f(t(i),Y(i));
YNEXT=Y(i)+(K1*dt); % orginal euler step   
K2=f(t(i+1),YNEXT);
K=(K1+K2)/2;        %final slope step.
Y(i+1)=Y(i)+(K*dt); %Y(i) value after doing modified eulers method
end
% Finish the code here to calculate the two output vectors
% t=[t0 t1 ... tend], Y=[Y0 Y1 ...] given t0, tend, Y0 and dt.