function Y = Y_exact(t)
% Y provides the "EXACT" analytic solution to the productivity problem
% dY/dt = f(t,Y) over a vector of times t.
    
    k= 2*pi/45;
    Y= 30+(10*k/(10*k^2+0.1)-10)*exp(-0.1*t)-10*k/(10*k^2+0.1)*cos(k*t)+1/(10*k^2+0.1)*sin(k*t);
    
end
