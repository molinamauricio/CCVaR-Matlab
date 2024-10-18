function [par, logL]=optimqlske(z)

[n,m]=size(z);

theta0 = [10,0.5];

[par,logL,~,~,~,~,Hessian]=fmincon('qlske',theta0,[],[],[],[],[2,-1],[Inf,1],[],[],z);
