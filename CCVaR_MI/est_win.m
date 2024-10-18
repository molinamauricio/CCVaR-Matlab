%Size of each rolling window
s=2361-99;

[par_arma_n_1, log_n_1, u_n_1, sig_n_1]=fitparm_n(X1,s);
[par_arma_n_2, log_n_2, u_n_2, sig_n_2]=fitparm_n(X2,s);
[par_arma_t_1, log_t_1, u_t_1, sig_t_1]=fitparm_t(X1,s);
[par_arma_t_2, log_t_2, u_t_2, sig_t_2]=fitparm_t(X2,s);
[par_arma_s_1, log_s_1, u_s_1, sig_s_1]=fitparm(X1,s);
[par_arma_s_2, log_s_2, u_s_2, sig_s_2]=fitparm(X2,s);

[theta_amh_n, err_amh_n, Llik_amh_n]=fitcop_AMH(u_n_1,u_n_2);
[theta_amh_t, err_amh_t, Llik_amh_t]=fitcop_AMH(u_t_1,u_t_2);
[theta_amh_s, err_amh_s, Llik_amh_s]=fitcop_AMH(u_s_1,u_s_2);
[theta_gb_n, err_gb_n, Llik_gb_n]=fitcop_GB(u_n_1,u_n_2);
[theta_gb_t, err_gb_t, Llik_gb_t]=fitcop_GB(u_t_1,u_t_2);
[theta_gb_s, err_gb_s, Llik_gb_s]=fitcop_GB(u_s_1,u_s_2);
[theta_gum_n, err_gum_n, Llik_gum_n]=fitcop_gum(u_n_1,u_n_2);
[theta_gum_t, err_gum_t, Llik_gum_t]=fitcop_gum(u_t_1,u_t_2);
[theta_gum_s, err_gum_s, Llik_gum_s]=fitcop_gum(u_s_1,u_s_2);

N=100000;
MCVaR_n_por_95 = MCVaR_n_all([X1, X2],0.5,par_arma_n_1,par_arma_n_2,sig_n_1,sig_n_2,N,s,0.95);
MCVaR_n_por_99 = MCVaR_n_all([X1, X2],0.5,par_arma_n_1,par_arma_n_2,sig_n_1,sig_n_2,N,s,0.99);
MCVaR_t_por_95 = MCVaR_t_all([X1, X2],0.5,par_arma_t_1,par_arma_t_2,sig_t_1,sig_t_2,N,s,0.95);
MCVaR_t_por_99 = MCVaR_t_all([X1, X2],0.5,par_arma_t_1,par_arma_t_2,sig_t_1,sig_t_2,N,s,0.99);
MCVaR_s_por_95 = MCVaR_s_all([X1, X2],0.5,par_arma_s_1,par_arma_s_2,sig_s_1,sig_s_2,N,s,0.95);
MCVaR_s_por_99 = MCVaR_s_all([X1, X2],0.5,par_arma_s_1,par_arma_s_2,sig_s_1,sig_s_2,N,s,0.99);


CCVaR_gb_n_por_95 = CCVaR_gb_n_all([X1, X2],0.5,theta_gb_n,par_arma_n_1,par_arma_n_2,sig_n_1,sig_n_2,N,s,0.95);
CCVaR_gb_t_por_95 = CCVaR_gb_t_all([X1, X2],0.5,theta_gb_t,par_arma_t_1,par_arma_t_2,sig_t_1,sig_t_2,N,s,0.95);
CCVaR_gb_s_por_95 = CCVaR_gb_s_all([X1, X2],0.5,theta_gb_s,par_arma_s_1,par_arma_s_2,sig_s_1,sig_s_2,N,s,0.95);
CCVaR_amh_n_por_95 = CCVaR_amh_n_all([X1, X2],0.5,theta_amh_n,par_arma_n_1,par_arma_n_2,sig_n_1,sig_n_2,N,s,0.95);
CCVaR_amh_t_por_95 = CCVaR_amh_t_all([X1, X2],0.5,theta_amh_t,par_arma_t_1,par_arma_t_2,sig_t_1,sig_t_2,N,s,0.95);
CCVaR_amh_s_por_95 = CCVaR_amh_s_all([X1, X2],0.5,theta_amh_s,par_arma_s_1,par_arma_s_2,sig_s_1,sig_s_2,N,s,0.95);
CCVaR_gum_n_por_95 = CCVaR_gum_n_all([X1, X2],0.5,theta_gum_n,par_arma_n_1,par_arma_n_2,sig_n_1,sig_n_2,N,s,0.95);
CCVaR_gum_t_por_95 = CCVaR_gum_t_all([X1, X2],0.5,theta_gum_t,par_arma_t_1,par_arma_t_2,sig_t_1,sig_t_2,N,s,0.95);
CCVaR_gum_s_por_95 = CCVaR_gum_s_all([X1, X2],0.5,theta_gum_s,par_arma_s_1,par_arma_s_2,sig_s_1,sig_s_2,N,s,0.95);
CCVaR_gb_n_por_99 = CCVaR_gb_n_all([X1, X2],0.5,theta_gb_n,par_arma_n_1,par_arma_n_2,sig_n_1,sig_n_2,N,s,0.99);
CCVaR_gb_t_por_99 = CCVaR_gb_t_all([X1, X2],0.5,theta_gb_t,par_arma_t_1,par_arma_t_2,sig_t_1,sig_t_2,N,s,0.99);
CCVaR_gb_s_por_99 = CCVaR_gb_s_all([X1, X2],0.5,theta_gb_s,par_arma_s_1,par_arma_s_2,sig_s_1,sig_s_2,N,s,0.99);
CCVaR_amh_n_por_99 = CCVaR_amh_n_all([X1, X2],0.5,theta_amh_n,par_arma_n_1,par_arma_n_2,sig_n_1,sig_n_2,N,s,0.99);
CCVaR_amh_t_por_99 = CCVaR_amh_t_all([X1, X2],0.5,theta_amh_t,par_arma_t_1,par_arma_t_2,sig_t_1,sig_t_2,N,s,0.99);
CCVaR_amh_s_por_99 = CCVaR_amh_s_all([X1, X2],0.5,theta_amh_s,par_arma_s_1,par_arma_s_2,sig_s_1,sig_s_2,N,s,0.99);
CCVaR_gum_n_por_99 = CCVaR_gum_n_all([X1, X2],0.5,theta_gum_n,par_arma_n_1,par_arma_n_2,sig_n_1,sig_n_2,N,s,0.99);
CCVaR_gum_t_por_99 = CCVaR_gum_t_all([X1, X2],0.5,theta_gum_t,par_arma_t_1,par_arma_t_2,sig_t_1,sig_t_2,N,s,0.99);
CCVaR_gum_s_por_99 = CCVaR_gum_s_all([X1, X2],0.5,theta_gum_s,par_arma_s_1,par_arma_s_2,sig_s_1,sig_s_2,N,s,0.99);


plot(1:100, MCVaR_s_por_95,'-.')
hold on
plot(1:100, CCVaR_amh_s_por_95)
hold on
plot(1:100, CCVaR_gb_s_por_95)
hold on
plot(1:100, CCVaR_gum_s_por_95)
xlabel('Trading days')
legend('MCVaR','CCVaR-AMH cop','CCVaR-GB cop','CCVaR-Gum cop')
title('MCVaR and CCVaR for $\beta=0.95$ and Skewed-t innovations and copula','interpreter','latex')
plot(1:100, MCVaR_s_por_95,'-.r*')
hold on
plot(1:100, CCVaR_amh_s_por_95,'--mo')
hold on
plot(1:100, CCVaR_gb_s_por_95)
hold on
plot(1:100, CCVaR_gum_s_por_95,':bs')
xlabel('Trading days')
legend('MCVaR','CCVaR-AMH cop','CCVaR-GB cop','CCVaR-Gum cop')
title('MCVaR and CCVaR for $\beta=0.95$ and Skewed-t innovations and copula','interpreter','latex')
plot(1:100, MCVaR_s_por_95,'-.r*')
hold on
plot(1:100, CCVaR_amh_s_por_95,'--bo')
hold on
plot(1:100, CCVaR_gb_s_por_95,':gs')
hold on
plot(1:100, CCVaR_gum_s_por_95,'.xm')
plot(1:100, CCVaR_gum_s_por_95,'-.xm')
xlabel('Trading days')
legend('MCVaR','CCVaR-AMH cop','CCVaR-GB cop','CCVaR-Gum cop')
title('MCVaR and CCVaR for $\beta=0.95$ and Skewed-t innovations and copula','interpreter','latex')
plot(1:100, MCVaR_s_por_99,'-.r*')
hold on
plot(1:100, CCVaR_amh_s_por_99,'--bo')
hold on
plot(1:100, CCVaR_gb_s_por_99,':gs')
hold on
plot(1:100, CCVaR_gum_s_por_99,'.xm')
xlabel('Trading days')
legend('MCVaR','CCVaR-AMH cop','CCVaR-GB cop','CCVaR-Gum cop')
title('MCVaR and CCVaR for $\beta=0.99$ and Skewed-t innovations and copula','interpreter','latex')
plot(1:100, MCVaR_s_por_99,'-.r*')
hold on
plot(1:100, CCVaR_amh_s_por_99,'--bo')
hold on
plot(1:100, CCVaR_gb_s_por_99,':gs')
hold on
plot(1:100, CCVaR_gum_s_por_99,'-.xm')
xlabel('Trading days')
legend('MCVaR','CCVaR-AMH cop','CCVaR-GB cop','CCVaR-Gum cop')
title('MCVaR and CCVaR for $\beta=0.99$ and Skewed-t innovations and copula','interpreter','latex')