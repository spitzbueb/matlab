function extrapolation = Schalcher_i10a_S8_Aufg3(f,x0,h0,n)

%---------------------------------------------------------
% Berechnet h²-Extrapolation
% Parameter:
% f:        Beliebige Funktion
% h0:       h-Startwert
% n:        Anzahl 
%
% Output:
% extrapolation:    Angenäherter Wert für Ableitung von f
%---------------------------------------------------------

D = zeros(n);
zaehler = 1;
k = 1;
i = 1;

h(zaehler)=h0;

while zaehler<=n,
    h(zaehler+1) = h(zaehler)/(2^zaehler);
    zaehler = zaehler + 1;
end

zaehler = 1;

while zaehler<=n;
    D(zaehler,1) = (f(x0 + h(zaehler))-f(x0))/h(zaehler);
    zaehler = zaehler + 1;
end

while k<=n+1,
    while i<=n-k,
       D(k,i+1)=D(k+1,i) + ((D(k+1,i)-D(k,i))/(4^k-1));
       i = i+1;
    end
    i = 1;
    k = k + 1;
end
D
extrapolation = D(1,n);