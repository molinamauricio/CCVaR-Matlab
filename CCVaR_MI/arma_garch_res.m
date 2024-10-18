function [z,v,sig2]=arma_garch_res(par,X)
%theta = (a0,a1,c0,c1,d1) see Lee (2011)
[n,m]=size(X);
z=zeros(n,1);
theta=par;
e(1)=sqrt(theta(3));
sig2(1)=theta(3);
for t=2:n
	e(t)=X(t)-theta(1)-theta(2)*X(t-1);
	sig2(t)=theta(3)+theta(4)*e(t-1)^2+theta(5)*sig2(t-1);
end

for i=1:n
	z(i)=e(i)/sqrt(sig2(i));
end

v=theta(3)+theta(4)*e(n)^2+theta(5)*sig2(n);