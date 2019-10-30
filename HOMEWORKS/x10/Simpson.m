function Isimp = Simpson(a,b,n)
%assume n is even always
h=(b-a)./(n-1);
node=zeros(1,n);
node(1)=a;
%getting x values for n nodes.
for i=1:n-1
    node(i+1)=node(i)+h;
end
k=n-3; % last node before using simpson 3/8 rule

%last panel, use simpson 3/8 rule, it always consist of 4 nodes from k to n
I_lastPanel=((3*h)/8)*(Fun(node(k))+Fun(node(n))+(3*Fun(node(k+1)))+(3*Fun(node(k+2))));

%Simpson 1/3 rule quadature
I_OneThridSimpson_Panels=Fun(a)+Fun(node(k));
alpha=0;
beta=0;
for i=2:2:k-1
    alpha=alpha+Fun(node(i));
end
for i=3:2:k-2
    beta=beta+Fun(node(i));
end
I_OneThridSimpson_Panels=(h/3)*(I_OneThridSimpson_Panels+(4*alpha)+(2*beta));

%add up panels of both simpson rule methods
Isimp=I_OneThridSimpson_Panels+I_lastPanel;
end