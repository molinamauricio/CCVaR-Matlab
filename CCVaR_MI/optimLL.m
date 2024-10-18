function [par, logL, err] = optimLL(X)

[n,m] = size(X);


theta0 = [mean(X),0.2,0.01,0.1,0.3];

[par,logL,~,~,~,~,Hessian]=fmincon('qLL',theta0,[],[],[],[],[-Inf,-Inf,0,0,0],[],[],[],X);
err = sqrt(diag(inv(Hessian)));
