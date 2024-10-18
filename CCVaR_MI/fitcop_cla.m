function varargout = fitcop_cla(r1,r2)
%Estimates the parameters for Clayton copula
%r1 and r2 must be the series transform in uniform by their respective cdf
tic;
[n m]=size(r1);
thetahat_cla=cell(n,1);
Hessian=cell(n,1);
err_cla=cell(n,1);
% Maximum likelihood estimation

%Parameter estimates for Clayton copula

lower = -1+1e-12;			% setting lower bound just above 0
											% upper bound just below 1
theta0 = 0.5;					% starting values
for i=1:n
	try
		[thetahat_cla{i},~,~,~,~,~,Hessian{i}]  = fmincon('claytonCL',theta0,[],[],[],[],lower,[],[],[],[r1{i} r2{i}]);
		err_cla{i} = sqrt(diag(inv(Hessian{i})));
		display([i]);
	catch EX
	end
	display([i]);
end
varargout{1}=thetahat_cla;
varargout{2}=err_cla;
elapsed_time=toc;
display([elapsed_time]);
end
