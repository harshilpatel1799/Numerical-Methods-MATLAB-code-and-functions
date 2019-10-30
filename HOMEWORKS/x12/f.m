function dYdt= f(t,Y)
% This function is called by Euler.m to provide the RHS
% ('slope function') to the IVP dY/dt = f(t,Y)

    dYdt = 3 - 0.1*Y + sin(2*pi*t/45);    % RHS to dY/dt= f(t,Y)

end
