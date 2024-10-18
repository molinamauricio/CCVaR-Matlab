%Normal innovations
[theta_gum_n, err_gum_n]=fitcop_gum(u_n_1,u_n_2);
[theta_amh_n, err_amh_n]=fitcop_AMH(u_n_1,u_n_2);
[theta_gb_n, err_gb_n]=fitcop_GB(u_n_1,u_n_2);

%Student-t innovations
[theta_gum_t, err_gum_t]=fitcop_gum(u_t_1,u_t_2);
[theta_amh_t, err_amh_t]=fitcop_AMH(u_t_1,u_t_2);
[theta_gb_t, err_gb_t]=fitcop_GB(u_t_1,u_t_2);

%Skewed-t innovations
[theta_gum_s, err_gum_s]=fitcop_gum(u_s_1,u_s_2);
[theta_amh_s, err_amh_s]=fitcop_AMH(u_s_1,u_s_2);
[theta_gb_s, err_gb_s]=fitcop_GB(u_s_1,u_s_2);