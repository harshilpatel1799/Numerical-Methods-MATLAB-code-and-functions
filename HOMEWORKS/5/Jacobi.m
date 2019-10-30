function [Yhistory,ErrorX,ErrorR,Iter] = Jacobi(L,a,YL,YR,M,tolX,tolR)

% JACOBI uses the Jacobi method to solve for the height Y(x) for M
% equally-spaced points of a sagging cable supported at each end.
%
% INPUTS
%  L        Distance between cable supports (m)
%  a        Physical characteristic of cable (see problem sheet)
%  YL, YR   Height at left & right ends of cable
%  M        Number of equally-spaced points picked to solve Y(x)
%  tolX     Convergence tolerance for "proxy error" in Y vector (L2 norm)
%  tolR     Convergence tolerance for residual error (L2 norm)

% OUTPUTS
%  Yhistory Each column of Yhistory will be the height distribution
%           Y(x) for each Jacobi iteration.  Size: (M) x (# Iterations)
%  ErrorX   Vector (length: Iter) with L2-norm of "proxy error in X" for
%           each iteration.  For the initial guess, just set ErrorX= NaN.
%  ErrorR   Vector (length: Iter) with L2-norm of "residual error" for 
%           each iteration.
%  Iter     Total number of iterations it took to converge.

% ** YOU ** need to write and document this entire routine to provide the
% required outputs. Key things to remember:
%  1. For your initial guess, pick Y= (YR+YL)/2 for all the elements.
%  2. Use a "while loop" to keep iterating until you meet BOTH convergence
%     criteria.
%  3. Make sure the first (left-most) column of Yhistory is your initial
%     guess. Then each subsequent column (to the right) stores the next
%     iteration of the Y vector.  The very last column in Yhistory would
%     then be your "final" answer.


%% CREATE A and	b matrices that	represent the M equations for Yi in the	form AY=b where	Y=[Y1,…	,YM]'
deltaX=L/(M-1);
A=zeros(M,M);
b=zeros(M,1);
for i=1:M
    if (i==1)
        A(i,i)=1;
        b(i,1)=YL;
    elseif (i==M)
        A(i,i)=1;
        b(i,1)=YR;
    else
        A(i,i-1)=(1/(deltaX^2))+(1/(4*a*deltaX));
        A(i,i)=(-2/(deltaX^2));
        A(i,i+1)=(1/(deltaX^2))-(1/(4*a*deltaX));
        b(i,1)=(1/a);
    end     
end
%% Initialize Intial Guess YO
Y=((YR+YL)/2)*ones(M,1);
Yhistory=Y;
%% Jacobi Operation:
% errorR=norm((A*Y)-b,2);
% errorX=NaN;
% ErrorR=errorR;
% ErrorX=errorX;

% the first iteration
Iter=1;
Ynew=zeros(M,1);
for i=1:M
  alpha=(A(i,:)*Y)-(A(i,i)*Y(i,1));
  Ynew(i)=(b(i)-alpha)/(A(i,i));
end
for c=1:M
Yhistory(c,Iter+1) = Ynew(c,1);
end 
errorR=norm((A*Ynew)-b,2);
ErrorR(1,Iter)=errorR;
errorX=norm(Ynew-Y,2);
ErrorX(1,Iter)=errorX;
Y=Ynew; 

while (errorX>tolX) && (errorR>tolR)
    Iter=Iter+1;
    for i=1:M
        alpha=(A(i,:)*Y)-(A(i,i)*Y(i,1));
        Ynew(i)=(b(i)-alpha)/(A(i,i));
    end
    for c=1:M
        Yhistory(c,Iter+1) = Ynew(c,1);
    end
    errorR=norm((A*Ynew)-b,2);
    ErrorR(1,Iter)=errorR;
    errorX=norm(Ynew-Y,2);
    ErrorX(1,Iter)=errorX;
    Y=Ynew; 
end
