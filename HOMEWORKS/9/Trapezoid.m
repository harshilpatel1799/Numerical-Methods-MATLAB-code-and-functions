function Itrap= Trapezoid(a,b,n)
h=(b-a)/(n-1);
node=zeros(1,n);
node(1)=a;
for i=1:n
    node(i+1)=node(i)+h;
end
alpha=(h/2)*(Fun(a)+Fun(b));
sigma=0;
for i=2:n-1
    sigma=sigma+Fun(node(i));
end
sigma=h*sigma;
Itrap=alpha+sigma;
end