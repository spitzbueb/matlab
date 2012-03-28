clear all;
%
% Aufgabe a
%
% F1 = x3 * sin(x1 + x2) + x3^2 * x2 - 2 = 0
% F2 = x1^2*x2 + x3*x1 + x3^2*x2^2 - 9 = 0
% F3 = x1*x2*x3 + sin(x1*x2*x3) = 0
%
% Für Jacobi:
% F1 nach x1:       x3 * cos(x1 + x2)
% F1 nach x2:       x3 * cos(x1 + x2) + x3^2
% F1 nach x3:       sin(x1+x2) + 2*x3*x2
% F2 nach x1:       2*x1*x2 + x3
% F2 nach x2:       x1^2 + 2*x2*x3^2
% F2 nach x3:       x1 + 2*x3*x2^2
% F3 nach x1:       x2*x3 + cos(x1*x2*x3)*x2*x3
% F3 nach x2:       x1*x3 + cos(x1*x2*x3)*x1*x3
% F3 nach x3:       x1*x2 + cos(x1*x2*x3)*x1*x2

xschlange = [0.5;2;1];
F=[1;1;1]
n=1;
xplot(1,n) = xschlange(1);
xplot(2,n) = xschlange(2);
xplot(3,n) = xschlange(3);

while(norm(F)>=10^(-14)),
    F(1,1) = xschlange(3) * sin(xschlange(1)+xschlange(2)) + xschlange(3)^2 * xschlange(2) - 2;
    F(2,1) = xschlange(1)^2 * xschlange(2) + xschlange(3)*xschlange(1) + xschlange(3)^2 * xschlange(2)^2 - 9;
    F(3,1) = xschlange(1)*xschlange(2)*xschlange(3) + sin(xschlange(1)*xschlange(2)*xschlange(3));
    jacobi(1,1) = xschlange(3) * cos(xschlange(1) + xschlange(2));
    jacobi(1,2) = xschlange(3) * cos(xschlange(1) + xschlange(2)) + xschlange(3)^2;
    jacobi(1,3) = sin(xschlange(1) + xschlange(2)) + 2*xschlange(3)*xschlange(2);
    jacobi(2,1) = 2*xschlange(1)*xschlange(2) + xschlange(3);
    jacobi(2,2) = xschlange(1)^2 + 2*xschlange(2)*xschlange(3)^2;
    jacobi(2,3) = xschlange(1) + 2*xschlange(3)*xschlange(2)^2;
    jacobi(3,1) = xschlange(2)*xschlange(3) + cos(xschlange(1)*xschlange(2)*xschlange(3))*xschlange(2)*xschlange(3);
    jacobi(3,2) = xschlange(1)*xschlange(3) + cos(xschlange(1)*xschlange(2)*xschlange(3))*xschlange(1)*xschlange(3);
    jacobi(3,3) = xschlange(1)*xschlange(2) + cos(xschlange(1)*xschlange(2)*xschlange(3))*xschlange(1)*xschlange(2);
    F = -F;
    jacobi = jacobi^(-1);
    delta_x = jacobi * F;
    all_delta(1,n+1) = delta_x(1);
    all_delta(2,n+1) = delta_x(2);
    all_delta(3,n+1) = delta_x(3);
    xschlange = delta_x + xschlange
    xplot(1,n+2) = xschlange(1);
    xplot(2,n+2) = xschlange(2);
    xplot(3,n+2) = xschlange(3);
    n = n+1;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Aufgabe b
%
figure(1);
hold on;
grid on;
for zahl=1:size(xplot,2),   
    plot(zahl,xplot(1,zahl),'.','color','red');
    plot(zahl,xplot(2,zahl),'.','color','blue');
    plot(zahl,xplot(3,zahl),'.','color','green');
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Aufgabe c
%
figure(2);
hold on;
grid on;
for zahl=1:size(all_delta,2),
    semilogy(zahl,all_delta(1,zahl),'.');hold on;
    semilogy(zahl,all_delta(2,zahl),'.');hold on;
    semilogy(zahl,all_delta(3,zahl),'.');hold on;
end