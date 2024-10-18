function lt=qlske(theta,z)
%theta = (vega,lambda)

[n,m]=size(z);
f = @(x) skewtdis_pdf(x,theta(1),theta(2));

l=0;
for t=1:n
	l=l+log(f(z(t)));
end

lt=-(1/n)*l;