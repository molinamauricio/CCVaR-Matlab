function out = AMH_CL(theta,data)

% The negative copula log-likelihood of a  member of Ali-Mikhail-Haq's family

% INPUTS: theta ;
%				data = [U V];


u = data(:,1);
v = data(:,2);

a = 1+theta*((1+u).*(1+v)-3)+(theta^2)*(1-u).*(1-v);
b = (1-theta*(1-u).*(1-v));
CL = log(a)-3*log(b);
out = sum(CL);
out = -out;
