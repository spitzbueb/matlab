clear all;
clc;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Aufgabe a
%
u = [0.1;0.2;0.3];
v = [0.395;0.134;-0.119];

plot(u,v,'.');
xlim([0.0 0.5]);
xlabel('u');
ylabel('v');
legend('Messwerte','location','south');
title('Aufgabe 1a');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Aufgabe b
%
% v = alpha * e^(beta*u) * cos(2*pi*u)
F1 = @(x,u,v) x(1)*exp(x(2)*u(1))*cos(2*pi*u(1))-v(1);
F2 = @(x,u,v) x(1)*exp(x(2)*u(2))*cos(2*pi*u(2))-v(2);
F3 = @(x,u,v) x(1)*exp(x(2)*u(3))*cos(2*pi*u(3))-v(3);

% Ableitungen
% F1 nach alpha:    e(beta*u) * cos(2*pi*u)
% F1 nach beta:     alpha*exp(beta*u) * u * cos(2*pi*u)
% F2 nach alpha:    e(beta*u) * cos(2*pi*u)
% F2 nach beta:     alpha*exp(beta*u) * u * cos(2*pi*u)
% F3 nach alpha:    e(beta*u) * cos(2*pi*u)
% F3 nach beta:     alpha*exp(beta*u) * u * cos(2*pi*u)
dF1_dAlpha = @(x,u) exp(x(2)*u(1)) * cos(2*pi*u(1));
dF1_dBeta = @(x,u) x(1)*exp(x(2)*u(1))*u(1)*cos(2*pi*u(1));
dF2_dAlpha = @(x,u) exp(x(2)*u(2)) * cos(2*pi*u(2));
dF2_dBeta = @(x,u) x(1)*exp(x(2)*u(2))*u(2)*cos(2*pi*u(2));
dF3_dAlpha = @(x,u) exp(x(2)*u(3)) * cos(2*pi*u(3));
dF3_dBeta = @(x,u) x(1)*exp(x(2)*u(3))*u(3)*cos(2*pi*u(3));

F = @(x,u,v) [F1(x,u,v); F2(x,u,v);F3(x,u,v)];

jacobi = @(x,u) ([dF1_dAlpha(x,u), dF1_dBeta(x,u);
                dF2_dAlpha(x,u), dF2_dBeta(x,u);
                dF3_dAlpha(x,u), dF2_dBeta(x,u);]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Aufgabe c
%
X = [0;1];
k = 1;
xdelta = 1;

while norm(xdelta) > 10^(-10),
    b = -F(X(:,k),u,v);
    A = jacobi(X(:,k),u);
    xdelta = A\b;
    X(:,k+1) = X(:,k) + xdelta;
    k=k+1;
end

X

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Aufgabe d
%
xsize = size(X,2);
figure(1);
hold on;
u = [0.1:0.01:0.3];

for k=1 : xsize,
    v = X(1,k) * exp(X(2,k).*u) .* cos(2*pi.*u);
    plot (u,v)
    hold on;
end