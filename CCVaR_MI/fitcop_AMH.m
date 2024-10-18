function varargout = fitcop_AMH(r1,r2)
%Estimates the parameters for AMH copula
%r1 and r2 must be the series transform in uniform by their respective cdf
tic;
[n m]=size(r1);
thetahat_amh=cell(n,1);
Hessian=cell(n,1);
Llik=cell(n,1);
err_amh=cell(n,1);
% Maximum likelihood estimation

%Parameter estimates for AMH copula

lower = -1;
upper = 1-1e-6;
theta0 = 0.8663;

for i=1:n
	try
		[thetahat_amh{i},Llik{i},~,~,~,~,Hessian{i}]  = fmincon('AMH_CL',theta0,[],[],[],[],lower,upper,[],[],[r1{i} r2{i}]);
		err_amh{i} = sqrt(diag(inv(Hessian{i})));
		display([i]);
	catch EX
	end
end
varargout{1}=thetahat_amh;
varargout{2}=err_amh;
varargout{3}=Llik;
elapsed_time=toc;
display([elapsed_time]);
end
