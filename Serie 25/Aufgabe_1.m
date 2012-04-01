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

x = [0.5;2;1];
F=[1;1;1];
zahl=1;
k=0;
while(norm(F)>=10^(-14)),
    F=[x(3) * sin(x(1)+x(2)) + x(3)^2 * x(2) - 2;x(1)^2 * x(2) + x(3)*x(1) + x(3)^2 * x(2)^2 - 9;x(1)*x(2)*x(3) + sin(x(1)*x(2)*x(3))];
    jacobi=[x(3)*cos(x(1)+x(2)) x(3)*cos(x(1)+x(2))+x(3)^2 sin(x(1)+x(2))+2*x(3)*x(2);2*x(1)*x(2)+x(3) x(2)+2*x(2)*x(3)^2 x(1)+2*x(3)*x(2)^2;x(2)*x(3)+cos(x(1)*x(2)*x(3))*x(2)*x(3) x(1)*x(3)+cos(x(1)*x(2)*x(3))*x(1)*x(3) x(2)*x(1)+cos(x(1)*x(2)*x(3))*x(2)*x(1)];
    Deltax=jacobi\(-F);
    x=x+Deltax;
    k=k+1;
    delta_all(zahl,:) = Deltax;
    xplot(zahl,:)=x;
    zahl=zahl+1;
end
x
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Aufgabe b
%
figure(1);
hold on;
grid on;
for zahl=1:size(xplot,1),
    plot(zahl,xplot(zahl,1),'.','color','red');
    plot(zahl,xplot(zahl,2),'.','color','blue');
    plot(zahl,xplot(zahl,3),'.','color','green');
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Aufgabe c
%
figure(2);
hold on;
grid on;
for zahl=1:size(delta_all,1),
    semilogy(zahl,delta_all(zahl,1),'.','color','red'); hold on;
    semilogy(zahl,delta_all(zahl,2),'.','color','blue'); hold on;
    semilogy(zahl,delta_all(zahl,3),'.','color','green'); hold on;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Aufgabe d
%
x = [0.5;2;1];
jacobi=[x(3)*cos(x(1)+x(2)) x(3)*cos(x(1)+x(2))+x(3)^2 sin(x(1)+x(2))+2*x(3)*x(2);2*x(1)*x(2)+x(3) x(2)+2*x(2)*x(3)^2 x(1)+2*x(3)*x(2)^2;x(2)*x(3)+cos(x(1)*x(2)*x(3))*x(2)*x(3) x(1)*x(3)+cos(x(1)*x(2)*x(3))*x(1)*x(3) x(2)*x(1)+cos(x(1)*x(2)*x(3))*x(2)*x(1)];
F=[1;1;1];
k=0;
while(norm(F)>=10^(-14)),
    all_x(zahl,:) = x;
    F=[x(3) * sin(x(1)+x(2)) + x(3)^2 * x(2) - 2;x(1)^2 * x(2) + x(3)*x(1) + x(3)^2 * x(2)^2 - 9;x(1)*x(2)*x(3) + sin(x(1)*x(2)*x(3))];
    Deltax=jacobi\(-F);
    x=x+Deltax;
    k=k+1;
    delta_all(zahl,:) = Deltax;
    xplot(zahl,:)=x;
    zahl=zahl+1;
end
x
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Aufgabe e
%
figure(3);
hold on;
grid on;
for zahl=1:k,
    plot(zahl,all_x(zahl,1),'.','color','red');
    plot(zahl,all_x(zahl,2),'.','color','blue');
    plot(zahl,all_x(zahl,3),'.','color','green');
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Aufgabe f
%
figure(4);
hold on;
grid on;
for zahl=1:k,
    plot(zahl,delta_all(zahl,1),'.','color','red');
    plot(zahl,delta_all(zahl,2),'.','color','blue');
    plot(zahl,delta_all(zahl,3),'.','color','green');
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Aufgabe g
%
% Iteration dauert viel länger, braucht mehr Schritte. Die Näherung ist
% trotzdem nicht schlecht.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Aufgabe h
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
