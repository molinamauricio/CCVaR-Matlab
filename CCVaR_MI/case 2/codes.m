IXIC.Properties.VariableNames{2} = 'NASDAQ';
STOXX50E.Properties.VariableNames{2} = 'STOXX';
T = outerjoin(IXIC,STOXX50E);
R=rmmissing(T);
nas = table2array(R(:,2));
sto = table2array(R(:,4));
X1 = -100*price2ret(nas);
X2 = -100*price2ret(sto);
dates = table2array(R(2:end,1));
e1= X1-mean(X1);
autocorr(e1);
parcorr(e1)
[h_nas_N,p_nas_N] = lbqtest(e1,'Lags',[1:10])
archtest(e1,'lags',[1:10])
autocorr(e1.^2);
parcorr(e1.^2)
e2= X2-mean(X2);
[h_sto_N,p_sto_N] = lbqtest(e2.^2,'Lags',[1:10])
archtest(e2,'lags',[1:10])
autocorr(e2.^2);
parcorr(e2.^2)



s=1222;


[par_arma_n_1, log_n_1, u_n_1, sig_n_1]=fitparm_n(X1,s);
[par_arma_n_2, log_n_2, u_n_2, sig_n_2]=fitparm_n(X2,s);
[theta_gum_n, err_gum_n]=fitcop_gum(u_n_1,u_n_2);
[theta_amh_n, err_amh_n]=fitcop_AMH(u_n_1,u_n_2);
[theta_gb_n, err_gb_n]=fitcop_GB(u_n_1,u_n_2);

[par_arma_t_1, log_t_1, u_t_1, sig_t_1]=fitparm_t(X1,s);
[par_arma_t_2, log_t_2, u_t_2, sig_t_2]=fitparm_t(X2,s);
[theta_gum_t, err_gum_t]=fitcop_gum(u_t_1,u_t_2);
[theta_amh_t, err_amh_t]=fitcop_AMH(u_t_1,u_t_2);
[theta_gb_t, err_gb_t]=fitcop_GB(u_t_1,u_t_2);

[par_arma_s_1, log_s_1, u_s_1, sig_s_1]=fitparm(X1,s);
[par_arma_s_2, log_s_2, u_s_2, sig_s_2]=fitparm(X2,s);
[theta_gum_s, err_gum_s]=fitcop_gum(u_s_1,u_s_2);
[theta_amh_s, err_amh_s]=fitcop_AMH(u_s_1,u_s_2);
[theta_gb_s, err_gb_s]=fitcop_GB(u_s_1,u_s_2);


