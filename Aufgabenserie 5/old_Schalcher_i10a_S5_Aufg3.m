% Benutzung des Matlab-Programmes:
% 1. eine nxn Matrix A definieren. Name muss A sein
% 2. einen Vektor b definieren. Name muss b sein, nicht umformen in
%    Spaltenvektor
% 3. Script ausführen. A wird gespeichert, so wie b auch und wieder in den
%    Ursprungszustand versetzt am Schluss.

b=b';
B=A;
c=b;
dA=[size(A)];
zaehler=1;

% Prüfung ob Matrizen überhaupt genutzt werden können
if (dA(1)-dA(2))~=0,
    display('Nicht gleiche Dimension von A')
    return;
end

db = [size(b)];

if (dA(1)-db(1))~=0,
    display('b hat nicht gleiche Dimension wie A')
end

% Matrizen umwandeln - rechts-obere Dreiecksmatrix
for i=1:dA(1),
    for j=i+1:dA(1),
       m(zaehler) = A(j,i)/A(i,i);
       
       A(j,:)=A(j,:)-(m(zaehler).*A(i,:));
       b(j) = b(j)-(m(zaehler).*b(i));
       zaehler = zaehler + 1;
    end
end
m
for i=1:zaehler-1,
    m(i) = -m(i);
end
m
rechts_oben = A;
A=B;

% links-untere Dreiecksmatrix aus Einheitsmatrix
links_unten = eye(dA(1));
zaehler = 1;

for i=1:dA(1),
    for j=i+1:dA(1),
        links_unten(j,i)=m(zaehler);
        zaehler = zaehler + 1;
    end
end

% Berechne per Funktion R-Matrix, L-Matrix und Permutationsmatrix und
% vergleiche beide
[L,U,P] = lu(A);

% x berechnen
% erster X Wert:

x(dA(1)) = b(dA(1))/A(dA(1),dA(1));



% restlichen X Werte - nicht funktionstüchtig...
for i=dA(1):-1:1,
	summeax=0;
	
   for j=i+1:dA(1)
       summeax = summeax + (A(i,j)*x(j));
   end
   
   x(i) = (b(i) - summeax) / A(i,i);
end


% Ausgaben
display('Recht-Obere Dreiecksmatrix:')
rechts_oben
U
display('Links-Untere Dreiecksmatrix:')
links_unten
L
display('Matrix b ist die Folgende:')
b
display('X hat folgende Werte:')
x'

clear x;
b=c;

% Matrix 1 aus 3.3
% A=[32 -10 -41;0 0.25 1.625; 0 0 -1.5]
% b1 = [-39 4.3750 -4.5]
% x1 = [2 -2 3]
% b2 = [48 6 -6]
% x2 = [6 -2 4]
%
% Matrix 2 aus 3.3
% A=[12 34 9;0 1.3333 1.5;0 0 1.5]
% b1 =[107 7.1667 4.5]
% x1 = [1 2 3]
% b2 = [42 -2 -6]
% x2 = [-2 3 -4]
%
% Matrix 3 aus 3.3
% A=[6 -9 -27;0 17 -41;0 0 -0.1765]
% b1 = [75 215 0.7059]
% x1 = [-1 3 -4]
% b2 = [-120 -198 -0.7059]
% x2 = [-5 -2 4]



