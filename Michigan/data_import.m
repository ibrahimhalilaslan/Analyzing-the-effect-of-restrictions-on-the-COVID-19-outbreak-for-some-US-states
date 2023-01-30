%% Import data from text file

%% Setup the Import Options and import the data
opts = spreadsheetImportOptions("NumVariables", 2);

% Specify sheet and range
opts.Sheet = "Sheet1";
opts.DataRange = "A2:B52";

% Specify column names and types
opts.VariableNames = ["states", "census"];
opts.VariableTypes = ["string", "double"];

% Specify variable properties
opts = setvaropts(opts, "states", "WhitespaceRule", "preserve");
opts = setvaropts(opts, "states", "EmptyFieldRule", "auto");

% Import the data
statecensus = readtable("state_census.xlsx", opts, "UseExcel", false);


%% Clear temporary variables
clear opts


%% Setup the Import Options and import the data
opts = delimitedTextImportOptions("NumVariables", 5);

% Specify range and delimiter
opts.DataLines = [2, Inf];
opts.Delimiter = ",";

% Specify column names and types
opts.VariableNames = ["date", "state", "fips", "cases", "deaths"];
opts.VariableTypes = ["datetime", "categorical", "double", "double", "double"];

% Specify file level properties
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";

% Specify variable properties
opts = setvaropts(opts, "state", "EmptyFieldRule", "auto");
opts = setvaropts(opts, "date", "InputFormat", "yyyy-MM-dd");

% Import the data
usstates = readtable("us-states.csv", opts);


%% Clear temporary variables
clear opts


