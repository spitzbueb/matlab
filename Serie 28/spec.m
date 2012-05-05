function s=spec(c)
n=length(c);
ns=(n-1)/2;
s=zeros(1,ns);
s(1)=abs(c(1));
for k=1:1:ns
    s(k+1)=sqrt(c(2*k)^2+c(2*k+1)^2);
end