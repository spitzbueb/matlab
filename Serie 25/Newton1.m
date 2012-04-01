%Newton
clear all
f1=1
f2=2
x1=[-2:0.1:2];
y2=[-4:0.1:3];

y1=1-2.*x1.^3;
x2=5-y2.^2-y2;

figure(f1);
plot(x1,y1,'r')
hold on 
plot(x2,y2,'b')
xlabel('x_1')
ylabel('x_2')

k=0
x=[2;-5];
%x=[-2;5];
figure(f1);
text(x(1),x(2),num2str(k),'Color','green')
hold on
Deltax=[1;1]
while (norm(Deltax))> 10^(-7)
    F=[x(2)+2*x(1).^3-1;x(2).^2+x(2)+x(1)-5]
    Jacobi=[6*x(1)^2 1;1 2*x(2)+1]
    Deltax=Jacobi\(-F)
    x=x+Deltax
    figure(f2);
    plot(k,log10(norm(Deltax)),'x')
    xlabel('k')
    ylabel('log_{10}||\Delta x||_2')
    hold on
    k=k+1
    figure(f1);
    text(x(1),x(2),num2str(k),'Color','green')
end