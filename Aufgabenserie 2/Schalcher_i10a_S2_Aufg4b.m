clc;
clear;
x=logspace((-5),5);

f = 5./((2.*x).^(2/3));
g = 10^5.*(2*exp(1)).^(-x./100);
h = ((10.^(2.*x)) ./ (2.^(5.*x))).^2;

subplot(3,1,1); loglog(x,f);
subplot(3,1,2); semilogy(x,g);
subplot(3,1,3); semilogx(x,h);