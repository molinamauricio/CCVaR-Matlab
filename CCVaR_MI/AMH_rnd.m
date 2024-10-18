function out1 = AMH_rnd(theta,T)

%T number of observation desired

u=rand(T,1);
w=rand(T,1);

b=1-u;
A = w.*(theta*b).^2-theta;
B = (theta+1)-2*theta*b.*w;
C = w-1;

v= (-B + sqrt(B.^2 -4*A.*C))./(2*A);
v = 1-v;

out1(:,1)=u;
out1(:,2)=v;
