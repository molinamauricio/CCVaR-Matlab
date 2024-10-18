function varargout = fitcop_fra(r1,r2)
%Estimates the parameters for Clayton copula
%r1 and r2 must be the series transform in uniform by their respective cdf
tic;
[n m]=size(r1);
thetahat_fra=cell(n,1);
Hessian=cell(n,1);
err_fra=cell(n,1);
% Maximum likelihood estimation

%Parameter estimates for Clayton copula


theta0 =0.5;					% starting values
for i=1:n
	try
		[thetahat_fra{i},~,~,~,~,~,Hessian{i}]  = fmincon('frankCL',theta0,[],[],[],[],[],[],[],[],[r1{i} r2{i}]); 
		err_fra{i} = sqrt(diag(inv(Hessian{i})));
		display([i]);
	catch EX
	end
	display([i]);
end
varargout{1}=thetahat_fra;
varargout{2}=err_fra;
elapsed_time=toc;
display([elapsed_time]);
end


