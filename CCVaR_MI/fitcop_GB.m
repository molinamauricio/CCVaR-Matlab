function varargout = fitcop_GB(r1,r2)
%Estimates the parameters for GB copula
%r1 and r2 must be the series transform in uniform by their respective cdf
tic;
[n m]=size(r1);
thetahat_gb=cell(n,1);
Hessian=cell(n,1);
Llik=cell(n,1);
err_gb=cell(n,1);
% Maximum likelihood estimation

%Parameter estimates for AMH copula

lower = 1e-5;
upper = 1;
theta0 = 0.5;

for i=1:n
	try
		[thetahat_gb{i},Llik{i},~,~,~,~,Hessian{i}]  = fmincon('GB_CL',theta0,[],[],[],[],lower,upper,[],[],[r1{i} r2{i}]);
		err_gb{i} = sqrt(diag(inv(Hessian{i})));
		display([i]);
	catch EX
	end
end
varargout{1}=thetahat_gb;
varargout{2}=err_gb;
varargout{3}=Llik;
elapsed_time=toc;
display([elapsed_time]);
end
