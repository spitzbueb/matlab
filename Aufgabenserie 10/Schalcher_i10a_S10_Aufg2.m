function [T] = Schalcher_i10a_S10_Aufg2(f,a,b,n)

% Berechnung der Romberg-Extrapolation der Trapezregel.
% Input:
% f:        Funktion, von welcher die Integration angenähert werden soll
% a:        Startwert des Intervalls
% b:        Endwert des Intervalls
% n:        Anzahl der ersten Trapezformeln (T00 bis Tn0)
%
% Output:
% T:        Extrapolierter Wert der Annäherung

summe = 0;

for i=1:n,
    h(i)=(b-a)/(2^(i-1));
end

Tf_matrix = zeros(n);


for i=1:n,
    anzahl_xi(i)=(b-a)/h(i);
end

for i=1:n,
    
    if ((a+h(i))-1)==0,
        Tf_matrix(i,1) = h(i) * ((f(a)+f(b))/2);
    else
        for k=1:(anzahl_xi-1),
            summe = summe + f(a+k*h(i));
        end
        
        Tf_matrix(i,1) = h(i) * ( ((f(a)+f(b))/2) + summe);
    end
end

for k=1:n,
    for i=1:(n-k),
        Tf_matrix(k,i+1) = Tf_matrix(k+1,i) + ((Tf_matrix(k+1,i)-Tf_matrix(k,i))/(4^k-1));
    end
end
T = Tf_matrix(1,n);