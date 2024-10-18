function varargout = CCVaR_cla(r,par_cop,par_arima,par_skew,sigma,n1,s,cl)
  tic;
  format long;

  [n ~]=size(r);
  [row_cl,col_cl]=size(cl);
  ni=n-s;
  mu=zeros(ni,2);
  z=zeros(n1,2);
  r_sample=zeros(n1,2);
  CVaR1=zeros(n1,1);
  CVaR2=zeros(n1,1);
  CCVaR=zeros(ni,1);
  CVaR_sample_out=cell(ni,2);
  index=zeros(ni,1);
  for i=1:ni
    mu(i,1)=par_arima{i,1}(1)+par_arima{i,1}(2)*r(s+i-1,1);
    mu(i,2)=par_arima{i,2}(1)+par_arima{i,2}(2)*r(s+i-1,2);
    out = clayton_rnd(par_cop{i},n1);
    z(:,1) = skewtdis_inv(out(:,1), par_skew{i,1}(1),par_skew{i,1}(2));
    z(:,2) = skewtdis_inv(out(:,2), par_skew{i,2}(1),par_skew{i,2}(2));
    r_sample(:,1) = mu(i,1)+sigma{i,1}*z(:,1);
    r_sample(:,2) = mu(i,2)+sigma{i,2}*z(:,2);
    u = level_cla(par_cop{i}, cl, n1);
    for j=1:n1
      try
        [CVaR1(j) CVaR2(j)]=alg_cvar_cla(r_sample, cl, [u(j,1) u(j,2)], par_cop{i});
      catch EX
      end
    end
    CVaR_sample_out{i,1}=CVaR1;
    CVaR_sample_out{i,2}=CVaR2;
    [CCVaR(i) index(i)] = min(0.5*CVaR1+0.5*CVaR2);
    display([i]);
  end

varargout{1} = CCVaR;
varargout{2} = CVaR_sample_out;
varargout{3} = index;
