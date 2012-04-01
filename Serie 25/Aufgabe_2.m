clear all

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%55
%
% Aufgabe b
%
% Für Jacobi:
% F1 nach x1:   3/|x|
% F1 nach x2:   -2*x2
% F2 nach x1:   4x1 - x2 - 5
% F2 nach x2:   -x1

x=[2;2];
F=[1;1];
zahl=1;
k=0;
while (norm(F)>=10^(-10)),
    F=[x(1)-x(2)^2+3*log(abs(x(1)));2*x(1)^2-x(1)*x(2)-5*x(1)+1];
    jacobi=[3/abs(x(1)) -2*x(2);4*x(1)-x(2)-5 -x(1)];
    Deltax=jacobi\(-F);
    x=x+Deltax;
    k=k+1;
    delta_all(zahl,:) = Deltax;
    xplot(zahl,:)=x;
    zahl=zahl+1;
end
k
x

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Aufgabe c
%
figure(1);
hold on;
grid on;
for zahl=1:k,
    plot(zahl,xplot(zahl,1),'.','color','red');
    plot(zahl,xplot(zahl,2),'.','color','blue');
end

figure(2);
hold on;
grid on;
for zahl=1:k,
    plot(zahl,delta_all(zahl,1),'.','color','red');
    plot(zahl,delta_all(zahl,2),'.','color','blue');
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Aufgabe d
%
% Anzahl der Iterationen:   17
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Aufgabe e
%
% x = [3.7568;2.7798]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Aufgabe f
%
x=[2;2];
F=[1;1];
zahl=1;
k=0;
lambda_x=1;
jacobi=[3/abs(x(1)) -2*x(2);4*x(1)-x(2)-5 -x(1)];
abbruch=0;
while (abbruch == 0),
    F=[x(1)-x(2)^2+3*log(abs(x(1)));2*x(1)^2-x(1)*x(2)-5*x(1)+1];
    delta_x=(jacobi^(-1))*(-F);
    prov_x=x+lambda_x.*delta_x;
    
    while(norm(F) > (1-(lambda_x/4)*norm(F))),
        lambda_x = 0.5*lambda_x
        if lambda_x>=0.1,
            prov_x=x+lambda_x.*delta_x;
        else
            abbruch=1;
        end
    end
    
    if (norm(F)<10^(-10)),
        abbruch=1;
    else
        k=k+1;
    end
end
x