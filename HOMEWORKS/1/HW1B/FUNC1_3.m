function S = FUNC1_3(x,N)
%FUNC1_3 approximates the sin(x)=f(x) fuction using the taylor series expanasion form using inputs x, the value which user wants to
% apporximate the sin function at and N, as depth of expansion for the taylor series to apporximate the sin function at.

N=1:2:N;
E1=((-1).^((N-1)/2)).*((x.^N)./factorial(N)); %vectorized function to approximate term for each taylor series function. 
S=sum(E1); % approximate S(x,N)

end

% 1.3b
%error of S(π/2,5) = 0.00452
%error of S(π/2,11) = -5.63e-08
%error of S(π/2,17) = -4.37e-14
