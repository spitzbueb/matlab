function d=pcompress(p,c)
n=length(c);
q=((1-p)*norm(c))^2;
d=c;
max=norm(c,inf);
s=0; 
r=0;
while (s<q)
    min=max;
    jmin=1;
    for j=1:1:n
        if (abs(d(j))>0 & abs(d(j))<min) 
            min=abs(d(j));
            jmin=j;
        end    
    end
    s=s+(d(jmin))^2;
    if (s<q) 
        r=r+1;
        d(jmin)=0;
    end
end
comprate=r/n