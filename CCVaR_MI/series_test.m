%Run testes for Heteroscedasticity for each series

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

[ljung_res_1, ljung_res_sqr_1, arch_1] = acfgraphs(e1,"S&P500")
[ljung_res_2, ljung_res_sqr_2, arch_2] = acfgraphs(e2,"Nikkei225")