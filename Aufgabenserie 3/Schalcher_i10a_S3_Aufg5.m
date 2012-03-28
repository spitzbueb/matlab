function [ z ] = Schalcher_i10a_S3_Aufg5( func,a,b,tol )
%SCHALCHER_I10_S3_AUFG5(@(x) func,Intervallstart,Intervallende,Genauigkeit)
%   In der While-Schleife wird solange die Bisektion ausgeführt bis
%   Intervallstart gleich dem Intervallsende ist.

x = [a:0.1:b];
y = func(x);
wechsel = false;
j=1;
%for i=1 : length(y)-1,
%    if sign(y(i)) ~= sign(y(i+1)),
%        if wechsel == true,
%            errordlg('In diesem Intervall gibt es 2 Nullstellen und koennen daher nicht gefunden werden')
%            return;
%        end
%        wechsel = true;
%    end
%end

nullstelle = func((a+b)/2) * func(a);

while nullstelle ~= 0 && j<=tol,
    if nullstelle > 0,
       a = (a + b)/2; 
       z = a;
    end
    
    if nullstelle < 0,
        b = (a + b)/2;
        z = b;
    end
    
    nullstelle = func((a+b)/2) * func(a);
    if a==b,
        z = a;
        return;
    end
    j=j+1;
end