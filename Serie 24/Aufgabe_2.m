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
x1 = [-5:5];
x2 = [-5:5];
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

x1 = [-5:5];
x2 = [-5:5];
F1 = x1.^2 + a;
F2 = x2.^2 + a;

figure(2)
hold on
grid on
plot(x1,F1,'red')
plot(F2,x2,'blue')