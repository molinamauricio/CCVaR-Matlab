ts1 = timeseries(-X1,1:2362);
ts2 = timeseries(-X2,1:2362);


ts1.Name = 'Returns S&P 500';
ts1.TimeInfo.Units = 'days';
ts1.TimeInfo.StartDate = '09-Sep-2010';     % Set start date.
ts1.TimeInfo.Format = 'mm-yyyy';       % Set format for display on x-axis.

ts1.Time = ts1.Time - ts1.Time(1);        % Express time relative to the start date.


ts2.Name = 'Returns Nikkei 225';
ts2.TimeInfo.Units = 'days';
ts2.TimeInfo.StartDate = '09-Sep-2010';     % Set start date.
ts2.TimeInfo.Format = 'mm-yyyy';       % Set format for display on x-axis.

ts2.Time = ts2.Time - ts2.Time(1);        % Express time relative to the start date.

ts3 = timeseries(abs(-X1),1:2362);
ts4 = timeseries(abs(-X2),1:2362);

ts3.Name = 'Absolute returns S&P 500';
ts3.TimeInfo.Units = 'days';
ts3.TimeInfo.StartDate = '09-Sep-2010';     % Set start date.
ts3.TimeInfo.Format = 'mm-yyyy';       % Set format for display on x-axis.

ts3.Time = ts3.Time - ts3.Time(1);        % Express time relative to the start date.


ts4.Name = 'Absolute return Nikkei 225';
ts4.TimeInfo.Units = 'days';
ts4.TimeInfo.StartDate = '09-Sep-2010';     % Set start date.
ts4.TimeInfo.Format = 'mm-yyyy';       % Set format for display on x-axis.

ts4.Time = ts4.Time - ts4.Time(1);        % Express time relative to the start date.

figure
subplot(2,2,1)
plot(ts1)

subplot(2,2,2)
plot(ts2)

subplot(2,2,3)
plot(ts3)

subplot(2,2,4)
plot(ts4)
