function varargout=CCVaR_gum_n_all(r,p,par_gum,par_arma1,par_arma2,sig1,sig2,N,s,beta)
%Estimate copula based CVaR with Gumbel copula and margins modeled by
%AR(1)-GARCH(1,1) with normal distribution.

tic;
format long;

[n m]=size(r);

%portfolio return

ni=n-s;
out=cell(ni,1);
parameters=zeros(2);
CCVaR_out=zeros(1,ni);
%%

%% Test

%%

for i=1:ni
	%% marginal distribution parameters
	parameters(1,1)=par_arma1{i}.Constant;
	parameters(1,2)=par_arma2{i}.Constant;
	parameters(2,1)=par_arma1{i}.AR{1};
	parameters(2,2)=par_arma2{i}.AR{1};
	mu1=parameters(1,1)+parameters(2,1)*r(s+i-1,1);
	mu2=parameters(1,2)+parameters(2,2)*r(s+i-1,2);
	sigma1=sig1{i}(1);
	sigma2=sig2{i}(1);
	w=par_gum{i};


	CCVaR_out(i) = CCVaR_gum_n(beta, p, [mu1, sigma1], [mu2, sigma2], w, N);
	i
end


%% Output
varargout{1}=CCVaR_out;


%%
elapsed_time=toc;
display([elapsed_time]);
end
