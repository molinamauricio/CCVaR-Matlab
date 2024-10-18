# CCVaR-Matlab
Estimation of Copula-based Conditional Value at Risk
Code for estimation of CCVaR written on Matlab 2019a proposed in: 
-Remarks on a copula‐based conditional value at risk for the portfolio problem. AM Molina Barreto, N Ishimura
Intelligent Systems in Accounting, Finance and Management 30 (3), 150-170

Prerequisites:
1. Andrew Patton's Matlab: Copula toolbox for Matlab
Download: https://public.econ.duke.edu/~ap172/code.html
2. Alexandros Gabrielsen; ARMAX-GARCH-K-SK Toolbox (Estimation, Forecasting, Simulation and Value-at-Risk Applications)
Download: https://es.mathworks.com/matlabcentral/fileexchange/32882-armax-garch-k-sk-toolbox-estimation-forecasting-simulation-and-value-at-risk-applications

Example of use:
1. First run the import_csv.m that import data from the ^GSPC.csv and ^N225.csv files. This will generate two vectors containing the log-negative returns.
2. Run stock_series_graphs.m for graph of returns adn absolute return for each series.
3. For Heteroscedasticity test, run series_test.m.
4. For modeling of margins, run arma_garch_est.m
5. For Copula estimation run  copula_est.m
6. Finally, for CCVaR computation, run ccvar_est.m

Usually the variables names have an identifier like "_n" for normal, "_t" for Student-t and "_s" for skewed-t. And for copulas, the id is "_amh" for Ali-Mikhail-Haq copula, "_gb" for Gumbel-Barnett and "_gum" for Gumbel.
For example, the variable CCVaR_gum_n_por_99 contains the value for CCVaR calculated with Gumbel copula with Standard Normal innovations at risk level 99%.

For rolling estimation window, please run est_win.m. The size is given by the variable s. This can take some hours depending on how many windows are selected.

