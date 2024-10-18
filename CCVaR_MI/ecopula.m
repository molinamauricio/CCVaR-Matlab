function varargout=ecopula(x,y,U1,U2)
%Function to evaluate the empirical copula in the point (x,y) with sample U1,U2

[n,m]=size(U1);

V1=sort(U1);
V2=sort(U2);

inx_i=find(U1==x);
inx_j=find(U2==y);


out=(1/n)*sum(((U1<=V1(inx_i)).*(U2<=V2(inx_j))));


varargout{1}=out;
%varargout{2}=A;
