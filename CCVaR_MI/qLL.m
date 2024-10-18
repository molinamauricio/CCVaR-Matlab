function qLL = qLL(theta,X)
%theta = (a0,a1,c0,c1,d1) see Lee (2011)
[n,m]=size(X);

e=zeros(n,1);
sig2=zeros(n,1);

e(1)=sqrt(theta(3));
sig2(1)=theta(3);
for t=2:n
	e(t)=X(t)-theta(1)-theta(2)*X(t-1);
	sig2(t)=theta(3)+theta(4)*e(t-1)^2+theta(5)*sig2(t-1);
end

lt=0;
for t=1:n
	lt=lt+(e(t)^2)/(sig2(t))+log(sig2(t));
end
qLL=(1/n)*lt;

