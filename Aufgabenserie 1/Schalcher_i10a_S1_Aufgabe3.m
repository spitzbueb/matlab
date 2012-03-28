clear;
clc;
x=input('Zahl fuer Fakultaet:')
if isnan(x)==1,
    disp('Eingabe muss eine Zahl sein')
    return
end

t1 = tic;
ergebnis=fak(x);
toc(t1);
disp('Mit rekursiver Funktion:')
ergebnis



ergebnis=1;
t2 = tic;
for i = 1 : x,
    ergebnis = ergebnis * i;
end
toc(t2);
disp('Mit Schlaufe:')
ergebnis



% Die rekursive Funktion braucht längen, da sie sich selber immer wieder
% aufrufen muss und die mehr Zeit in Ansprich nimmt. Die For-Schlaufe kann
% einfach durchrechnen, ohne dass darin wieder die FAK-Funktion aufgerufen
% wird, weil in der For-Schlaufe selbst schon aufgezählt wird und mit
% dieser Zahl multipliziert werden kann