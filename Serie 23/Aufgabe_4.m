% Aufgabe 4a
u = [-4:4]';
v = [0.3;-1.7;2.7;-2.8;3.1;-2.9;2.5;-1.9;0.1];
hold on;
plot(u,v,'.')

% Aufgabe 4b
% Gleichung lautet ~v = ~alpha * ~u + ~beta
% mit ~v = v², ~alpha = c²/a², ~beta = c²,ũ = u²

% Aufgabe 4c
b = v.^2;
A = u.^2;
A(:,2) = 1;
X = A\b;
b
A
X

% Aufgabe 4d
% Als Ellipsengleichung
plot(u,u.^2/15.6032 + v.^2/8.9240,'red')

% Als Ausgleichsgeradengleichung
plot(u,-0.5719 * u.^2 + 8.9240,'green')