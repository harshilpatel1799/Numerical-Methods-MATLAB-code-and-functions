function Imid = Midpoint(a,b,n)
h=(b-a)/(n-1);
node=zeros(1,n);
node(1)=a;
for i=1:n
    node(i+1)=node(i)+h;
end
mid=zeros(1,n-1);
valueAtMidpoint=zeros(1,n-1);
for i=1:n-1
    mid(i)=(node(i)+node(i+1))/2;
    valueAtMidpoint(i)=Fun(mid(i));
end
alpha=sum(valueAtMidpoint);
Imid=h*alpha;
end