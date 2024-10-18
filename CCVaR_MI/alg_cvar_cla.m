function varargout = alg_cvar_cla(r, beta, u, par_cop)
  %Calculation algorithm for CVaR(R_i,u)
  %r =[r1 r2] return vector, pi discrete distribution, par_cop parameter of copula
  % C(u)=beta, and discrete distribution for Ri given by vector pi
  pi = 1/length(r(:,1));
  t=1;
  %for i=1
  pi_hat = pi;
  qi_hat = 0;
  level = beta;
  sum = 0;
  while level > 0 && t<length(r)
    qi(t)  = clayton_cdf(pi_hat,u(2),par_cop)-qi_hat;
    qi_hat = qi_hat+qi(t);
    if qi(t) < level
      sum = sum+qi(t)*r(t,1);
    else
      sum = sum+level*r(t,1);
    end
    t=t+1;
    pi_hat = pi_hat+pi;
    level = beta-qi_hat;
  end
  varargout{1}=sum/beta;

  %for i=2
  pi = 1/length(r(:,1));
  t=1;
  pi_hat = pi;
  qi_hat = 0;
  level = beta;
  sum = 0;
  while level > 0 && t<length(r)
    qi(t)  = clayton_cdf(u(1),pi_hat,par_cop)-qi_hat;
    qi_hat = qi_hat+qi(t);
    if qi(t) < level
      sum = sum+qi(t)*r(t,2);
    else
      sum = sum+level*r(t,2);
    end
    t=t+1;
    pi_hat = pi_hat+pi;
    level = beta-qi_hat;
  end
  varargout{2}=sum/beta;
end
