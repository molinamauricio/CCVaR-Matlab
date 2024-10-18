T=1222;
figure
subplot(2,3,1)
cdfplot(u_n_1{1})
hold on
x=linspace(0,1,10);
plot(x,x,'-.')
ylabel('Cumulative distribution')
title('NASDAQ - GARCH Normal')
hold off

subplot(2,3,2)
cdfplot(u_t_1{1})
hold on
x=linspace(0,1,10);
plot(x,x,'-.')
ylabel('Cumulative distribution')
title('NASDAQ - GARCH T')
hold off

subplot(2,3,3)
cdfplot(u_s_1{1})
hold on
x=linspace(0,1,10);
plot(x,x,'-.')
ylabel('Cumulative distribution')
title('NASDAQ - GARCH Skew-T')
hold off

subplot(2,3,4)
cdfplot(u_n_2{1})
hold on
x=linspace(0,1,10);
plot(x,x,'-.')
ylabel('Cumulative distribution')
title('STOXX50E - GARCH Normal')
hold off

subplot(2,3,5)
cdfplot(u_t_2{1})
hold on
x=linspace(0,1,10);
plot(x,x,'-.')
ylabel('Cumulative distribution')
title('STOXX50E - GARCH T')
hold off

subplot(2,3,6)
cdfplot(u_s_2{1})
hold on
x=linspace(0,1,10);
plot(x,x,'-.')
ylabel('Cumulative distribution')
title('STOXX50E - GARCH Skew-T')
hold off
