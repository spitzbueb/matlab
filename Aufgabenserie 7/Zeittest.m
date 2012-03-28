A=diag(diag(ones(3000)*4000))+ones(3000);
x=[1:1:1500,1500:-1:1]';
b=A*x;
x0=zeros(3000,1);
tol=10^-4;

t1=tic;
[xn,n,n2] = Schalcher_i10a_S7_Aufg3(A,b,x0,tol)
toc(t1)