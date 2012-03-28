clear all
% Aufgabe a
%
% F1 = x2 + 2x1^3 = 1
% > F1 = x2 + 2x1^3 -1 = 0
%
% F2 = x2^2 +x2 + x1 = 5
% > F2 = x2^2 + x2 + x1 - 5 = 0
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Aufgabe b
%
% Plot x2 = 1 - 2x1^3
x1 = [-2:0.1:2]';
hold on
grid on
plot(x1,1-2*x1.^3,'blue')

% Plot x1 = 5 - x2^2 - x2
x2 = [-4:0.1:3]';
plot(5-x2.^2 - x2,x2,'red')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Aufgabe c
%
% F1 nach x1:   6*x1^2
% F1 nach x2:   1
% F2 nach x1:   1
% F2 nach x2:   2x2 + 1
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Aufgabe e und f
%
xschlange = [2;-5];
for(n=1:5),
    F(1,1) = xschlange(2) + 2*xschlange(1)^3-1;
    F(2,1) = xschlange(2)^2 + xschlange(2) + xschlange(1) -5;
    jacobi(1,1) = 6*xschlange(1)^2;
    jacobi(1,2) = 1;
    jacobi(2,1) = 1;
    jacobi(2,2) = 2*xschlange(2) + 1;
    F = -F;
    jacobi = jacobi^(-1);
    delta_x = jacobi * F;
    all_delta(1,n) = delta_x(1);
    all_delta(2,n) = delta_x(2);
    xschlange = delta_x + xschlange
    xplot(1,n) = xschlange(1);
    xplot(2,n) = xschlange(2);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Aufgabe g
%
plot(xplot(1,:),xplot(2,:),'.')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Aufgabe h
%
figure(2);
hold on
grid on
plot(all_delta(1,:),all_delta(2,:),'red')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Aufgabe i
%
xschlange = [-2;5];
for(n=1:5),
    F(1,1) = xschlange(2) + 2*xschlange(1)^3-1;
    F(2,1) = xschlange(2)^2 + xschlange(2) + xschlange(1) -5;
    jacobi(1,1) = 6*xschlange(1)^2;
    jacobi(1,2) = 1;
    jacobi(2,1) = 1;
    jacobi(2,2) = 2*xschlange(2) + 1;
    F = -F;
    jacobi = jacobi^(-1);
    delta_x = jacobi * F;
    all_delta(1,n) = delta_x(1);
    all_delta(2,n) = delta_x(2);
    xschlange = delta_x + xschlange
    xplot(1,n) = xschlange(1);
    xplot(2,n) = xschlange(2);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Aufgabe j
%
figure(1)
plot(xplot(1,:),xplot(2,:),'.')
figure(2)
plot(all_delta(1,:),all_delta(2,:),'green')