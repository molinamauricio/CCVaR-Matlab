function varargout = CCVaR_amh_n(beta, p, param1, param2, theta, N)

  %beta level for VaR
  %p weight of portfolio
  % param parameter of the quantile functions
  % N number for the partition for approximate the integral

  mu1 = param1(1);
  sigma1 = param1(2);

  mu2 = param2(1);
  sigma2 = param2(2);

  Fint = @(x) (p*(sigma1*norminv(x)+mu1)+(1-p)*(sigma2*norminv(x)+mu2))*...
  (1-(beta*(1-theta*(1-beta)))/(x*(1-theta*(1-x))));

  xi = linspace(beta,1,N);
  dxi = (1-beta)/N;
  sum=0;
  for i=1:N-1
    sum=sum+Fint(xi(i));
  end

  varargout{1}=dxi*(Fint(beta)+sum)/(1-beta+(beta*(1-theta*(1-beta))/(1-theta))*log(beta/(1-theta*(1-beta))));
