function cdf = GB_cdf(u,v,k1)

%
% Computes the value of the Gumbel copula cdf at a specified point
%
% INPUTS:	U, a Tx1 vector (or a scalar) of F(X[t])
%				V, a Tx1 vector (or a scalat) of G(Y[t])
%				K, a Tx1 vector (or a scalar) of kappas
%



T = max([size(u,1),size(v,1),size(k1,1)]);

% stretching the input vectors to match
if size(u,1)<T;
   u = u*ones(T,1);
end
if size(v,1)<T;
   v = v*ones(T,1);
end
if size(k1,1)<T;
   k1 = k1*ones(T,1);
end

cdf = (u.*v).*exp(-k1.*(log(u).*log(v)));
