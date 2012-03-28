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
diagonale=1;
zaehler=0;

% Prüfung ob Matrizen überhaupt genutzt werden können
if (dA(1)-dA(2))~=0,
    display('Nicht gleiche Dimension von A')
    return;
end

db = [size(b)];

if (dA(1)-db(1))~=0,
    display('b hat nicht gleiche Dimension wie A')
end

% Matrizen umwandeln
for i=1:dA(1),
    for j=i:dA(1),
        p(j) = A(j,i);
    end
    for j=i:dA(1),
        if A(j,i)==max(p),
            if A(j,i)==0,
                display('A ist nicht regulär!')
                return
            else
                z = A(j,:);
                A(j,:) = A(i,:);
                A(i,:) = z; 
                
                zb = b(j);
                b(j) = b(i);
                b(i) = zb;
                
                zaehler = zaehler + 1;
            end
        end
    end
end

for i=1:dA(1),

    
    for j=i+1:dA(1),
       m = A(j,i)/A(i,i);
       
       A(j,:)=A(j,:)-(m.*A(i,:));
       b(j) = b(j)-(m.*b(i));
    end
    clear p
end

% Determinante ausrechen
determinante_1 = det(A);

for (i=1:dA(1)),
    diagonale = diagonale * A(i,i);
end

determinante_2 = (-1)^zaehler * diagonale;

% x berechnen
% erster X Wert:

x(dA(1)) = b(dA(1))/A(dA(1),dA(1))



% restlichen X Werte - nicht funktionstüchtig...
for i=dA(1):-1:1,
	summeax=0;
	
   for j=i+1:dA(1)
       summeax = summeax + (A(i,j)*x(j));
   end
   
   x(i) = (b(i) - summeax) / A(i,i);
end


% Ausgaben
display('Dreiecksmatrix A ist die Folgende:')
A
display('Matrix b ist die Folgende:')
b
display('X hat folgende Werte:')
x'
display('Determinante der Dreiecksmatrix lautet:')
if determinante_1==determinante_2,
    determinante_2
else
    display('Determinante wurde nicht korrekt berechnet!')
end

clear x;
A=B;
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
