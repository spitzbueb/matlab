function c=dft(v)
m=length(v);
if mod(m,2) ne 0
    % Fehlermeldung
end
w=(2/m)*v;

n=m/2-1;
c=zeros(1,2*n+1);
tj=0;
h=2*pi/m;
for j=1:1:m
    tj=tj+h;
    c(1)=c(1)+0.5*w(j);
    for k=1:1:n
        c(2*k)=c(2*k)+cos(k*tj)*w(j);
        c(2*k+1)=c(2*k+1)+sin(k*tj)*w(j);
    end
end
