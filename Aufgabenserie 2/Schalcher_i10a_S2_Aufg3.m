% Aufgabe 3a
clear;
clc;
format long;
n = 6;
s = 1;
naeherung = 0;

for j = 1 : 9,
    n(j+1)=2*n(j);
end

for j = 1 : 9,
    s(j+1) = sqrt(2-2*(sqrt(1-(s(j)^2/4))));
end

for j = 1 : 10,
    naeherung(j) = s(j) * n(j);
end

disp('2 * Pi ist: 2')
2 * pi

disp('Näherung ist: ')
naeherung

disp('Unterschied zu 2 * Pi: ')
(2*pi)-naeherung
figure(1);
xlim([min(n) max(n)]);
plot(n,naeherung);


% Aufgabe 3b
for j = 1 : 9,
    s(j+1) = sqrt(s(j)^2/(2*(1+sqrt(1-(s(j)^2/4)))));
end

for j = 1 : 10,
    naeherung(j) = s(j) * n(j);
end

disp('2 * Pi ist: 2')
2 * pi

disp('Näherung ist: ')
naeherung

disp('Unterschied zu 2 * Pi: ')
(2*pi)-naeherung

% Für grösseres n ist die zweite Formel näher an 2*Pi als die erste.
figure(2)
xlim([min(n) max(n)]);
plot(n,naeherung);