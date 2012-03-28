% Aufgabe 2a-------------------------------
clear;
clc;
p_eins=[1 -14 84 -280 560 -672 448 -128];
x=1.99:0.00004:2.01;
f_eins=polyval(p_eins,x);
f_zwei=(x-2).^2;
figure(1);
subplot(2,1,1);plot(x,f_eins);
subplot(2,1,2);plot(x,f_zwei);

% Der erste Plot hat eine viel feinere Y-Achse, also erscheint der "Zoom"
% im ersten Plot sich so von der gröberen Funktion abweicht.

% Aufgabe 2b
x=-10^(-14):10^(-17):10^(-14);
g=x./(sin(1.+x)-sin(1));
figure(2);
plot(x,g);

% Nein, da in extrem kleinen Bereich immer noch Unterschiede da sein
% können.

% Aufgabe 2c
g=x./(2.*cos((x+2)./2).*sin(x./2));
figure(3);
plot(x,g);

% Ausgabe wird nur noch als Linie dargestellt > Kaum sichtbar.
% Der Limes von g(x) geht gegen 0