function varargout=copVaR_cla_skewt(r,par_cop,par_arima,par_skew,sigma,n1,s,cl)
%Estimate copula based VaR with Clayton copula and margins modeled by AR(1)-GARCH(1,1) with Hansen skewed-t distribution
%Inputs:
%r: returns of the assets matrix size n x 2
%n1: number of points for estimation of VaR
%s: number of observations taken for prediction of VaR
%cl: confidence level matrix size 1 x 2


tic;
format long;

[n , ~]=size(r);
[row_cl,col_cl]=size(cl);

%portfolio return
rp=.5.*r(:,1)+.5.*r(:,2);
ni=n-s;



%%
mu1=ones(ni,1);
q=ones(n1,2);
rp_sample=cell(ni,1);
VaR=ones(ni,1);
CVaR = ones(ni,1);
%%
for i=1:ni
	%% marginal distribution parameters

	mu(i,1)=par_arima{i,1}(1)+par_arima{i,1}(2)*r(s+i-1,1);
	mu(i,2)=par_arima{i,2}(1)+par_arima{i,2}(2)*r(s+i-1,2);
	w=par_cop{i};
	%Generating n1 random samples from the copula
	out = clayton_rnd(w,n1);
	%Constructing the inverse CDF
	q(:,1)=skewtdis_inv(out(:,1),par_skew{i,1}(1),par_skew{i,1}(2));
	q(:,2)=skewtdis_inv(out(:,2),par_skew{i,2}(1),par_skew{i,2}(2));
	rp_sample{i}=.5.*(mu(i,1)+sigma{i,1}*q(:,1))+.5.*(mu(i,2)+sigma{i,2}*q(:,2));
	VaR(i)=quantile(rp_sample{i},cl(1));
	CVaR(i)=mean(rp_sample{i}(rp_sample{i}<VaR(i,1)));
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
title(['Clayton Copula with AR(1)-GARCH(1,1)-Skew T VaR at ',...
	num2str(cl(1)*100),'%'],'FontSize',12,'Fontweight','bold');
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
