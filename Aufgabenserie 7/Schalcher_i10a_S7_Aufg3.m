function [xn,n,n2] = Schalcher_i10a_S7_Aufg3(A,b,x0,tol)

%---------------------------------------------------------
% Berechnet per Gauss-Seidel eine Näherung an x
% Parameter:
% A:    reguläre m x m Matrix
% b:    m x 1 Spaltenvektor
% x0:   m x 1 Startvektor für Iteration
% tol:  reeler Toleranzwert
%
% Output:
% xn:   m x 1 Iterationsvektor nach n-ter Iteration
% n:    Anzahl der benötigten Iterationen
% n2:   Anzahl Iterationen gemäss a-priori Abschätzung
%---------------------------------------------------------

%Berechnug der Matrizen

L = A-triu(A);
D = diag(diag(A));
Dinv = D^(-1);
R = A-tril(A);


B = -(D+L)^(-1)*R;

% Berechnung der Unendlichkeitsform

B_inf = norm(B,inf);

% Test, ob das Gauss-Seidel-Verfahren kovergiert

if B_inf > 1,
    error('x ist kein anziehender Fixpunkt')
end

% Durchführen der Iterationen
xn = B*x0+((D+L)^(-1))*b;
n=1;

% a-priori Abschätzung vor der Durchführung
n2 = ceil(log(((1-B_inf)*tol)/norm(xn-x0,inf))/log(B_inf));


while B_inf/(1-B_inf)*norm(xn-x0,inf) >= tol,
    x0 = xn;    
    xn = B*x0+((D+L)^(-1))*b;
    n = n + 1;
end
end


% Zeittest: Gauss-Seidel: Elapsed time is 300.563772 seconds.
%           Gauss:  Kein funktionierendes Script.