
%MCVaR and CCVaR at beta=95% and beta=99% for the three specifications
MCVaR_n_95 = MCVaR_n_all([X1, X2],0.5,par_arma_n_1,par_arma_n_2,sig_n_1,sig_n_2,100000,s,0.95);
MCVaR_s_95 = MCVaR_s_all([X1, X2],0.5,par_arma_s_1,par_arma_s_2,sig_s_1,sig_s_2,100000,s,0.95);
MCVaR_t_95 = MCVaR_t_all([X1, X2],0.5,par_arma_t_1,par_arma_t_2,sig_t_1,sig_t_2,100000,s,0.95);
MCVaR_n_99 = MCVaR_n_all([X1, X2],0.5,par_arma_n_1,par_arma_n_2,sig_n_1,sig_n_2,100000,s,0.99);
MCVaR_s_99 = MCVaR_s_all([X1, X2],0.5,par_arma_s_1,par_arma_s_2,sig_s_1,sig_s_2,100000,s,0.99);
MCVaR_t_99 = MCVaR_t_all([X1, X2],0.5,par_arma_t_1,par_arma_t_2,sig_t_1,sig_t_2,100000,s,0.99);

CCVaR_amh_n_por_95 = CCVaR_amh_n_all([X1, X2],0.5,theta_amh_n,par_arma_n_1,par_arma_n_2,sig_n_1,sig_n_2,100000,s,0.95);
CCVaR_gum_n_por_95 = CCVaR_gum_n_all([X1, X2],0.5,theta_gum_n,par_arma_n_1,par_arma_n_2,sig_n_1,sig_n_2,100000,s,0.95);
CCVaR_gb_n_por_95 = CCVaR_gb_n_all([X1, X2],0.5,theta_gb_n,par_arma_n_1,par_arma_n_2,sig_n_1,sig_n_2,100000,s,0.95);
CCVaR_amh_s_por_95 = CCVaR_amh_s_all([X1, X2],0.5,theta_amh_s,par_arma_s_1,par_arma_s_2,sig_s_1,sig_s_2,100000,s,0.95);
CCVaR_gum_s_por_95 = CCVaR_gum_s_all([X1, X2],0.5,theta_gum_s,par_arma_s_1,par_arma_s_2,sig_s_1,sig_s_2,100000,s,0.95);
CCVaR_gb_s_por_95 = CCVaR_gb_s_all([X1, X2],0.5,theta_gb_s,par_arma_s_1,par_arma_s_2,sig_s_1,sig_s_2,100000,s,0.95);
CCVaR_amh_t_por_95 = CCVaR_amh_t_all([X1, X2],0.5,theta_amh_t,par_arma_t_1,par_arma_t_2,sig_t_1,sig_t_2,100000,s,0.95);
CCVaR_gum_t_por_95 = CCVaR_gum_t_all([X1, X2],0.5,theta_gum_t,par_arma_t_1,par_arma_t_2,sig_t_1,sig_t_2,100000,s,0.95);
CCVaR_gb_t_por_95 = CCVaR_gb_t_all([X1, X2],0.5,theta_gb_t,par_arma_t_1,par_arma_t_2,sig_t_1,sig_t_2,100000,s,0.95);

CCVaR_amh_n_por_99 = CCVaR_amh_n_all([X1, X2],0.5,theta_amh_n,par_arma_n_1,par_arma_n_2,sig_n_1,sig_n_2,100000,s,0.99);
CCVaR_gum_n_por_99 = CCVaR_gum_n_all([X1, X2],0.5,theta_gum_n,par_arma_n_1,par_arma_n_2,sig_n_1,sig_n_2,100000,s,0.99);
CCVaR_gb_n_por_99 = CCVaR_gb_n_all([X1, X2],0.5,theta_gb_n,par_arma_n_1,par_arma_n_2,sig_n_1,sig_n_2,100000,s,0.99);
CCVaR_amh_s_por_99 = CCVaR_amh_s_all([X1, X2],0.5,theta_amh_s,par_arma_s_1,par_arma_s_2,sig_s_1,sig_s_2,100000,s,0.99);
CCVaR_gum_s_por_99 = CCVaR_gum_s_all([X1, X2],0.5,theta_gum_s,par_arma_s_1,par_arma_s_2,sig_s_1,sig_s_2,100000,s,0.99);
CCVaR_gb_s_por_99 = CCVaR_gb_s_all([X1, X2],0.5,theta_gb_s,par_arma_s_1,par_arma_s_2,sig_s_1,sig_s_2,100000,s,0.99);
CCVaR_amh_t_por_99 = CCVaR_amh_t_all([X1, X2],0.5,theta_amh_t,par_arma_t_1,par_arma_t_2,sig_t_1,sig_t_2,100000,s,0.99);
CCVaR_gum_t_por_99 = CCVaR_gum_t_all([X1, X2],0.5,theta_gum_t,par_arma_t_1,par_arma_t_2,sig_t_1,sig_t_2,100000,s,0.99);
CCVaR_gb_t_por_99 = CCVaR_gb_t_all([X1, X2],0.5,theta_gb_t,par_arma_t_1,par_arma_t_2,sig_t_1,sig_t_2,100000,s,0.99);