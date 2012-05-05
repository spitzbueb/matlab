function d=maxfilter(max,c)
n=length(c);
d=c;
for k=2*max:1:n
    d(k)=0;
end