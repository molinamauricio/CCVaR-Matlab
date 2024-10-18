function varargout = fitparm(ret,s)
% fitparm estimate the parameters of specified marginals models
% The marginal model are AR(1)-GARCH(1,1) for t-skewed distribution
%Inputs
%ret: array with the return of the assets size n x 1
%s: number of observation taken for estimation
tic;
[n m]=size(ret);
param=cell(n-s,1);
logL=cell(n-s,1);
res=cell(n-s,1);
ht=cell(n-s,1);
udata=cell(n-s,1);
sigma1=cell(n-s,1);


%%
for i=1:n-s
	[param{i},~,logL{i},ht{i},res{i},~]=Garch(ret(i:i+s-1),'GARCH','HANSEN',1,0,0,1,1,0,[],[]);
	[~,v,~,~]=garchfor2(ret(i:i+s-1),res{i},ht{i},param{i},'GARCH','HANSEN',1,0,1,1,1);
	udata{i} = skewtdis_cdf(res{i}./sqrt(ht{i}), param{i}(7),param{i}(6));
	sigma1{i}=sqrt(v);
	display([i]);
end

varargout{1}=param;
varargout{2}=logL;
varargout{3}=udata;
varargout{4}=sigma1;
varargout{5}=res;
varargout{6}=ht;
elapsed_time=toc;
display([elapsed_time]);
end
