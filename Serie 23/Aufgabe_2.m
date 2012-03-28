% Aufgabe 2a
u = [0:9]'
v = [-200;-100;-50;0;150;400;600;1000;1700;3000]
hold on;
plot(u,v,'.');

% Aufgabe 2b
% für v = alpha + beta * u ^ 2
b = v;
A = u.^2;
A(:,2) = 1;
[Q,R] = qr(A);
Qb = Q' * b;
QA = R(1,1);
QA(1,2) = R(1,2);
QA(2,:) = R(2,:);
temp = Qb(1);
temp(2) = Qb(2);
Qb = temp';
X = QA ^ (-1) * Qb;
A
b
R
Q
Qb
QA
X

% für v = beta * e^u + alpha
b = v;
A = exp(u);
A(:,2) = 1;
[Q,R] = qr(A);
Qb = Q' * b;
QA = R(1,1);
QA(1,2) = R(1,2);
QA(2,:) = R(2,:);
temp = Qb(1);
temp(2) = Qb(2);
Qb = temp';
X = QA ^ (-1) * Qb;
A
b
R
Q
Qb
QA
X

% Aufgabe 2c
% Ausgleichsgerade 1: v = 34.5676 + (-335.1779 * u^2)
% Ausgleichsgerade 2: v = 0.3773 + 166.3918 * exp(u)
e = exp(1);
plot(u,34.5676 + (-355.1779 .* u.^2),'red');
plot(u,0.3773 + 166.3918 .* e.^u,'green');


% Aufgabe 2d
% Die Gleichung 2 (mit der eulerschen Zahl) weicht weniger stark von den
% Datenpunkten ab. Daher wäre diese wohl am besten geeignet. Natürlich nur
% sichtbar innerhalb des angegebenen Bereiches.