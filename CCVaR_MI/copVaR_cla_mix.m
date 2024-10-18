function varargout=copVaR_cla_mix(r,par_cla,par_arima1,par_arima2,par_mix1,par_mix2,sigmaone,sigmatwo,n1,s,cl)
%Estimate copula based VaR with Clayton copula and margins modeled by AR(1)-GARCH(1,1) with empirical distribution.
%Inputs:
%r: returns of the assets matrix size n x 2
%n1: number of points for estimation of VaR
%s: number of observations taken for prediction of VaR
%cl: confidence level matrix size 1 x 2

% This function produced 4 outputs arguments. the first output is the
% 'out' contain all of values that is calculated by double integrate in the
% body of function, this arguments used for control purpose; the second
% output argument is the estimated value at risk; the third output argument
% is the probability related to estimated value at risk and used for
% controlling purpose; the fourth is the numbers of violations.
tic;
format long;

[n , ~]=size(r);
[row_cl,col_cl]=size(cl);

%portfolio return
rp=.5.*r(:,1)+.5.*r(:,2);
ni=n-s;



%%
mu1=ones(ni,1);
mu2=ones(ni,1);
q=ones(n1,2);
rp_sample=cell(ni,1);
VaR=ones(ni,2);
CVaR = ones(ni,2);
%%
for i=1:ni
	%% marginal distribution parameters

	mu1(i)=par_arima1{i}(1)+par_arima1{i}(2)*r(s+i-1,1);
	mu2(i)=par_arima2{i}(1)+par_arima2{i}(2)*r(s+i-1,2);
	w=par_cla{i};
	%Generating n1 random samples from the copula
	out = clayton_rnd(w,n1);
	%Constructing the inverse CDF
	x=linspace(-4,4,n1);
	F1=par_mix1{i}(1)*normcdf(x,par_mix1{i}(2),sqrt(par_mix1{i}(4)))+(1-par_mix1{i}(1))*normcdf(x,par_mix1{i}(3),sqrt(par_mix1{i}(5)));
	F2=par_mix2{i}(1)*normcdf(x,par_mix2{i}(2),sqrt(par_mix2{i}(4)))+(1-par_mix2{i}(1))*normcdf(x,par_mix2{i}(3),sqrt(par_mix2{i}(5)));
	[F1,index1]=unique(F1);
	[F2,index2]=unique(F2);
	Finv1 = @(u) interp1(F1,x(index1),u,'linear','extrap');
	q(:,1)=Finv1(out(:,1));
	Finv2 = @(u) interp1(F2,x(index2),u,'linear','extrap');
	q(:,2)=Finv2(out(:,2));
	rp_sample{i}=.5.*(mu1(i)+sigmaone{i}*q(:,1))+.5.*(mu2(i)+sigmatwo{i}*q(:,2));
	VaR(i,1)=quantile(rp_sample{i},cl(1));
	CVaR(i,1)=mean(rp_sample{i}(rp_sample{i}<VaR(i,1)));
	VaR(i,2)=quantile(rp_sample{i},cl(2));
	CVaR(i,2)=mean(rp_sample{i}(rp_sample{i}<VaR(i,2)));
	display([i]);
end
%% Violations
violation=zeros(row_cl,col_cl);

for j=1:col_cl
    for i=1:ni
        if VaR(i,j) >rp(s+i)
            violation(j)=violation(j)+1;
        end
    end
end

%% Plotting
figure(1);
plot(1:(n-s),rp(s+1:n),'g.');
hold on;
plot(1:ni,VaR(1:ni,1),'r:');
hold on;
plot(1:ni,CVaR(1:ni,1),'b:');
legend('Portfolio Return','Clayton Copula with AR(1)-GARCH(1,1)-NM VaR','CVaR');
xlabel('Trading days','horizontal','center','Fontweight','bold');
ylabel('Portfolio Return','rotation',90,'horizontal',...
	'center','Fontweight','bold');
title(['Clayton Copula with AR(1)-GARCH(1,1)-NM VaR at ',...
	num2str(cl(1)*100),'%'],'FontSize',12,'Fontweight','bold');
hold off;
figure(2);
plot(1:(n-s),rp(s+1:n),'b.');
hold on;
plot(1:ni,VaR(1:ni,2),'m:');
hold on;
plot(1:ni,CVaR(1:ni,2),'g:');
legend('Portfolio Return','Clayton Copula with AR(1)-GARCH(1,1)-NM VaR','CVaR');
xlabel('Trading days','horizontal','center','Fontweight','bold');
ylabel('Portfolio Return','rotation',90,'horizontal',...
	'center','Fontweight','bold');
title(['Clayton Copula with AR(1)-GARCH(1,1)-NM VaR at ',...
	num2str(cl(2)*100),'%'],'FontSize',12,'Fontweight','bold');
hold off;
%% Output
varargout{1}=rp_sample;
varargout{2}=VaR;
varargout{3}=CVaR;
varargout{4}=violation;


%%
elapsed_time=toc;
display([elapsed_time]);
end
