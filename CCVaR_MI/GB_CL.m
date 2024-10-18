function out = GB_CL(theta,data)

% The negative copula log-likelihood of a  member of Ali-Mikhail-Haq's family

% INPUTS: theta ;
%				data = [U V];


u = data(:,1);
v = data(:,2);

a = -theta*log(u).*log(v);
b = (1-theta*log(u)).*(1-theta*log(v))-theta;
CL = a+log(b);
out = sum(CL);
out = -out;
