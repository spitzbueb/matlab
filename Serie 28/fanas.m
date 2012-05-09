m=80;
n=39;
h=2*pi/m;
t=[h:h:2*pi+0.1*h];
v=1./(2+sin(2.*t))+0.1*(sin(11.*t)).^3; %Beispiel aus der Vorlesung

c=dft(v);
x=[0:0.01:2*pi];
vn=c(1)*ones(1,length(x));
for k=1:1:n
    vn=vn+c(2*k).*cos(k.*x);
    vn=vn+c(2*k+1).*sin(k.*x);
end
figure(1)
plot(x,vn,'LineWidth',0.1,'Color','blue');
hold on
plot(t,v,'o','Markersize',4);
axis([0 6.28 -1 2]);
ylabel(' ','fontsize',24);

figure(2)
s=spec(c);
dc=0:n;
stem(dc,s);
axis([-1 length(s) 0 norm(s,inf)*1.2]);

figure(3)
d=pcompress(0.99,c);
vn=d(1)*ones(1,length(x));
for k=1:1:n
    vn=vn+d(2*k).*cos(k.*x);
    vn=vn+d(2*k+1).*sin(k.*x);
end
plot(x,vn,'LineWidth',0.1,'Color','blue');
hold on
plot(t,v,'o','Markersize',4);
axis([0 6.28 -1 2]);
ylabel(' ','fontsize',24);
% Aufgabe d
% Alles grösser 16 wird gefiltert
figure(4)
f=maxfilter(16,c);
vn=f(1)*ones(1,length(x));
for k=1:1:n
    vn=vn+f(2*k).*cos(k.*x);
    vn=vn+f(2*k+1).*sin(k.*x);
end
plot(x,vn,'LineWidth',0.1,'Color','blue');
hold on
plot(t,v,'o','Markersize',4);
axis([0 6.28 -1 2]);
ylabel(' ','fontsize',24);

% Aufgabe e
% Alles grösser 11 wird gefiltert
figure(5)
f=maxfilter(11,c);
vn=f(1)*ones(1,length(x));
for k=1:1:n
    vn=vn+f(2*k).*cos(k.*x);
    vn=vn+f(2*k+1).*sin(k.*x);
end
plot(x,vn,'LineWidth',0.1,'Color','blue');
hold on
plot(t,v,'o','Markersize',4);
axis([0 6.28 -1 2]);
ylabel(' ','fontsize',24);
