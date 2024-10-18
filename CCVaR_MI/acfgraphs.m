function varargout = acfgraphs(data,nameofdata)

% Graphs ACP and PACF and Ljung Box test with Eagle test for measure autocorrelation
% on the data

T = length(data);

e= data - mean(data);
[hl , pl] = lbqtest(e,'Lags',[1:10],'DOF',1);
[hsl , psl] = lbqtest(e.^2,'Lags',[1:10]);
[ha, pa] = archtest(e,'Lags',[1:10]);

ljung_res = [hl; pl];
ljung_res_sqr = [hsl; psl];
arch=[ha; pa];

figure(1)
subplot(2,1,1)
autocorr(e)
title(['Sample ACF for residuals of ',nameofdata])
subplot(2,1,2)
parcorr(e)
title(['Sample PACF for residuals of ',nameofdata])

figure(2)
subplot(2,1,1)
autocorr(e.^2)
title(['Sample ACF for squared residuals of ',nameofdata])
subplot(2,1,2)
parcorr(e.^2)
title(['Sample PACF for squared residuals of ',nameofdata])

varargout{1} = ljung_res;
varargout{2} = ljung_res_sqr;
varargout{3} = arch;
