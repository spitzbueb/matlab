function [Rf,Tf,Sf] = Schalcher_i10a_S9_Aufg3(f,a,b,n)

% Berechnung der Rechteck-, Trapez-, und Simpson-Formel
% Input:
% f:        Funktion, von welcher die Integration angenähert werden soll
% a:        Startwert des Intervalls
% b:        Endwert des Intervalls
% n:        Anzahl Intervalle
%
% Output:
% Rf:       Wert aus der Rechteck-Formel
% Tf:       Wert aus der Trapez-Formel
% Sf:       Wert aus der Simpson-Formel
%
% Aufruf:
% Schalcher_i10a_S9_Aufg3(@(x) x.^2,2,5,3)

h = (b-a)/n;

for i=1:n,
    x(i) = a + (i*h);
end

Rf = 0;

for i=1:n,
    Rf = Rf + f(x(i)+(h/2));
end

Tf = 0;

for i=1:(n-1),
    Tf = Tf + f(x(i));
end

Tf = (Tf + ((f(a) + f(b))/2))*h;

Sf_1 = 0;
Sf_2 = 0;
Sf = 0;

for i=1:(n-1),
    Sf_1 = Sf_1 + f(x(i));
end

for i=1:n,
    Sf_2 = Sf_2 + f((x(i-1) + x(i))/2);
end

Sf = (h/3) * (0.5*f(a) + Sf_1 + (2*Sf_2) + 0.5*f(b));