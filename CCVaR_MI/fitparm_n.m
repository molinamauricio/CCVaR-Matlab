function varargout = fitparm_n(ret,s)
% fitparm estimate the parameters of specified marginals models
% The marginal model are AR(1)-GARCH(1,1)
%Inputs
%ret: array with the return of the assets size n x 1
%s: number of observation taken for estimation
tic;
[n m]=size(ret);
EstMdl=cell(n-s,1);
logL=cell(n-s,1);
res=cell(n-s,1);
v=cell(n-s,1);
v1=cell(n-s,1);
udata=cell(n-s,1);
sigma1=cell(n-s,1);


%%
Mdl = arima('ARLags',1,'Variance',garch(1,1));
for i=1:n-s
	EstMdl{i} = estimate(Mdl,ret(i:i+s-1));
	[res{i},v{i},logL{i}] = infer(EstMdl{i},ret(i:i+s-1));
	udata{i} = normcdf(res{i}./sqrt(v{i}));
	[~,~,v1{i}]=forecast(EstMdl{i},1,'Y0',ret(i:(i+s-1)),'E0',res{i},'V0',v{i});
	sigma1{i}=sqrt(v1{i});
	display([i]);
end

varargout{1}=EstMdl;
varargout{2}=logL;
varargout{3}=udata;
varargout{4}=sigma1;
varargout{5}=res;
varargout{6}=v;
elapsed_time=toc;
display([elapsed_time]);
end
