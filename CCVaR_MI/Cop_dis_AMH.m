function varargout=Cop_dis_AMH(udata1, udata2, gamma, theta)

%distance between the empirical copula and estimated copula.
[n,~]=size(udata1);
sum=0;

j=1;
for i=1:n
	if udata1(i)>=gamma &&  udata2(i)>=gamma
		u1(j,1)=udata1(i);
		u1(j,2)=udata2(i);
		j=j+1;
	end
end

for i=1:j-1
	sum=sum+(AHM_cdf(u1(i,1),u1(i,2),theta)-ecopula(u1(i,1),u1(i,2),udata1,udata2))^2;

end

varargout{1}=sqrt(sum);
