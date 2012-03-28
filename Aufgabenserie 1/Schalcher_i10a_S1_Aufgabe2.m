clear;
clc;
vektoranzahl = input('Wieviele Koeffizienten sollen es sein: ');
x_start = input('Wo soll X starten: ');
x_end = input('Wo soll X enden: ');
Y = 0;

for i = 1 : vektoranzahl,
    A(i) = input('Bitte Koeffizient angeben: ');
end
durchlauf = max(size(A))-1;
X = x_start:1:x_end;

max(size(A))

for i = 0 : durchlauf,
    Y = Y + (A(i+1) * X.^(max(size(A))-i));
end

Y

plot(X,Y)