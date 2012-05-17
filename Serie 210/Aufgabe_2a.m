function y=Aufgabe_2a(t_start,y_start)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Aufgabe 2a
% Aufruf: ergebnis = Aufgabe_2a(t_start,y_start)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

t=t_start;
y=y_start;
h=0.25;
laufvariable = 1

% Euler
    while(t<=10),
       t1_gesamt(laufvariable) = t;
       y1_gesamt(laufvariable) = y;
       f = (1/(1+t^2)) - (2*y^2); 
       y = y + h*f;
       t = t + h;
       laufvariable = laufvariable + 1;
    end
    
hold on;
plot(t1_gesamt,y1_gesamt,'x','color','blue');


% Runge

t = t_start;
y = y_start;
h = 2*h;
laufvariable = 1;

    while(t<=10),
        t2_gesamt(laufvariable) = t;
        y2_gesamt(laufvariable) = y;
        f1 = (1/(1+t^2)) - (2*y^2);
        f2 = (1/(1+(t+(h/2))^2)) - (2*(y+(h/2)*f1));
        y = y + h*f2;
        t = t + h;
        laufvariable = laufvariable + 1;
    end

plot(t2_gesamt,y2_gesamt,'x','color','red');

t = [0:10];
y = t./(1+t.^2);

plot(t,y,'x','color','green');