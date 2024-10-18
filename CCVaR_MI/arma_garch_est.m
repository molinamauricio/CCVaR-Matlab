s=2361; %total number of observations

%ARMA-GARCH Estimation for each series
%Normal distribution innovations
[par_arma_n_1, log_n_1, u_n_1, sig_n_1]=fitparm_n(X1,s);
[par_arma_n_2, log_n_2, u_n_2, sig_n_2]=fitparm_n(X2,s);

%Student-t distribution innovations
[par_arma_t_1, log_t_1, u_t_1, sig_t_1]=fitparm_t(X1,s);
[par_arma_t_2, log_t_2, u_t_2, sig_t_2]=fitparm_t(X2,s);

%Skewed-t distribution innovations
[par_arma_s_1, log_s_1, u_s_1, sig_s_1]=fitparm(X1,s);
[par_arma_s_2, log_s_2, u_s_2, sig_s_2]=fitparm(X2,s);

%Plots for the estimates

figure
subplot(2,3,1)
cdfplot(u_n_1{1})
hold on
x=linspace(0,1,10);
plot(x,x,'-.')
ylabel('Cumulative distribution')
title('S&P500 - GARCH Normal')
hold off

subplot(2,3,2)
cdfplot(u_t_1{1})
hold on
x=linspace(0,1,10);
plot(x,x,'-.')
ylabel('Cumulative distribution')
title('S&P500 - GARCH T')
hold off

subplot(2,3,3)
cdfplot(u_s_1{1})
hold on
x=linspace(0,1,10);
plot(x,x,'-.')
ylabel('Cumulative distribution')
title('S&P500 - GARCH Skew-T')
hold off

subplot(2,3,4)
cdfplot(u_n_2{1})
hold on
x=linspace(0,1,10);
plot(x,x,'-.')
ylabel('Cumulative distribution')
title('Nikkei225 - GARCH Normal')
hold off

subplot(2,3,5)
cdfplot(u_t_2{1})
hold on
x=linspace(0,1,10);
plot(x,x,'-.')
ylabel('Cumulative distribution')
title('Nikkei225 - GARCH T')
hold off

subplot(2,3,6)
cdfplot(u_s_2{1})
hold on
x=linspace(0,1,10);
plot(x,x,'-.')
ylabel('Cumulative distribution')
title('Nikkei225 - GARCH Skew-T')
hold off

