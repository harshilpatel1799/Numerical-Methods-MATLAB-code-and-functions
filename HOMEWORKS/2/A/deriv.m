function fprime = deriv(a)
    x = 300;
    fprime = ((x+a).^2 - x^2) ./ a;
end