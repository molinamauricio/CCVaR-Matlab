%% Import data from text file

%% Set up the Import Options and import the data
opts = delimitedTextImportOptions("NumVariables", 7);

% Specify range and delimiter
opts.DataLines = [1, Inf];
opts.Delimiter = ",";

% Specify column names and types
opts.VariableNames = ["Date", "Var2", "Var3", "Var4", "Var5", "AdjClose", "Var7"];
opts.SelectedVariableNames = ["Date", "AdjClose"];
opts.VariableTypes = ["datetime", "string", "string", "string", "string", "double", "string"];

% Specify file level properties
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";

% Specify variable properties
opts = setvaropts(opts, ["Var2", "Var3", "Var4", "Var5", "Var7"], "WhitespaceRule", "preserve");
opts = setvaropts(opts, ["Var2", "Var3", "Var4", "Var5", "Var7"], "EmptyFieldRule", "auto");
opts = setvaropts(opts, "Date", "InputFormat", "yyyy-MM-dd", "DatetimeFormat", "preserveinput");

% Import the data
N225 = readtable("^N225.csv", opts);
GSPC = readtable("^GSPC.csv", opts);


%% Clear temporary variables
clear opts

%Create a single table containing the negative log-returns and assign X1
%and X2 to those series
GSPC.Properties.VariableNames{2} = 'S&P500';
N225.Properties.VariableNames{2} = 'Nikkei225';
T = outerjoin(GSPC,N225);
R=rmmissing(T);
sp500 = table2array(R(:,2));
nik = table2array(R(:,4));
X1 = -100*price2ret(sp500);
X2 = -100*price2ret(nik);
dates = table2array(R(2:end,1));