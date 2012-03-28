Y=2000:1:3000;
B=255-11*(mod(Y,19));
D=mod(B-21,30)+21;
if (D-48)>0,
    X=D-1
end
E=mod(Y+(Y/4) + X + 1,7);
Q=X+7-E;
if Q<32,
    Q
elseif Q>31,
    Z=Q-31;
    Z
end