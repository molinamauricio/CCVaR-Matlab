function varargout = fitcop_gum(r1,r2)
%Estimates the parameters for Clayton copula
%r1 and r2 must be the series transform in uniform by their respective cdf
tic;
[n , ~]=size(r1);
thetahat_gum=cell(n,1);
Hessian=cell(n,1);
Llik=cell(n,1);
err_gum=cell(n,1);
% Maximum likelihood estimation

%Parameter estimates for Clayton copula

lower = 1+1e-12;			% setting lower bound just above 1

theta0 = 2;					% starting values
for i=1:n
	try
		[thetahat_gum{i},Llik{i},~,~,~,~,Hessian{i}]  = fmincon('gumbelCL',theta0,[],[],[],[],lower,[],[],[],[r1{i} r2{i}]);
		err_gum{i} = sqrt(diag(inv(Hessian{i})));
		display([i]);
	catch EX
	end
	display([i]);
end
varargout{1}=thetahat_gum;
varargout{2}=err_gum;
varargout{3}=Llik;
elapsed_time=toc;
display([elapsed_time]);
end
