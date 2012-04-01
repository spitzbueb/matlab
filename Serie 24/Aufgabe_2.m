%
% Aufgabe a
%
% F1 = x1^2 - x2 + a = 0
% F2 = -x1 + x2^2 + a = 0
%
% mit a = 1
% > F1 = x1^2 - x2 + 1 = 0
% > F2 = -x1 + x2^2 + 1 = 0
%
% Für Plot: x2 = x1^2 + 1
%           x1 = x2^2 + 1
x1 = [-5:0.1:5];
x2 = [-5:0.1:5];
a=1;
F1 = x1.^2 + a;
F2 = x2.^2 + a;

hold on
grid on
figure(1)
plot(x1,F1,'red')
plot(F2,x2,'blue')
% Keine Lösungen für Schnittstellen bei dieser Ausgangslage
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Aufgabe b
%
%
a = 0.25;

x1 = [-5:0.1:5];
x2 = [-5:0.1:5];
F1 = x1.^2 + a;
F2 = x2.^2 + a;

figure(2)
hold on
grid on
plot(x1,F1,'red')
plot(F2,x2,'blue')

a = 0;

x1 = [-5:0.1:5];
x2 = [-5:0.1:5];
F1 = x1.^2 + a;
F2 = x2.^2 + a;

figure(3)
hold on
grid on
plot(x1,F1,'red')
plot(F2,x2,'blue')

a = -3;

x1 = [-5:0.1:5];
x2 = [-5:0.1:5];
F1 = x1.^2 + a;
F2 = x2.^2 + a;

figure(4)
hold on
grid on
plot(x1,F1,'red')
plot(F2,x2,'blue')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Aufgabe c
%
%
% F1 nach x1: 2*x1
% F1 nach x2: -1
% F2 nach x1: -1
% F2 nach x2: 2*x2
%
xschlange = [0;0];
a = 0.25;

for(n=1:15),
    F(1,1) = xschlange(1)^2 - xschlange(2) + a;
    F(2,1) = -xschlange(1) + xschlange(2)^2 + a;
    jacobi(1,1) = 2*xschlange(1);
    jacobi(1,2) = -1;
    jacobi(2,1) = -1;
    jacobi(2,2) = 2*xschlange(2);
    F = -F;
    jacobi = jacobi^(-1);
    delta_x = jacobi * F;
    all_delta(1,n) = delta_x(1);
    all_delta(2,n) = delta_x(2);
    xschlange = delta_x + xschlange
    xplot(1,n) = xschlange(1);
    xplot(2,n) = xschlange(2);
end