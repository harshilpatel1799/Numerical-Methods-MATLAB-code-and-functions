x = 0:15;
y = 10 * x .^ 2; 
plot(x,y,'-^'); %plots with the line AND triangles
xlabel('This is X')
ylabel('This is Y')
title('Harshil Patel')
print -dpdf PDF1_1