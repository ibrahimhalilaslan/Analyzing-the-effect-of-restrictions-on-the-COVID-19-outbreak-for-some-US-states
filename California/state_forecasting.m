  
 clear all
 clc

% data import
data_import;

 state_name = 'California'; %input('Please enter state name ', 's');
 
 data_i = [];
 data_census = [];
 
 while isempty(data_i) || isempty(data_census) 
     
 data_i = usstates.cases(usstates.state == state_name);
 data_d = usstates.deaths(usstates.state == state_name);
 data_census = statecensus.census(statecensus.states == state_name);
 data_date = usstates.date(usstates.state == state_name);

 
 end
 %%
 opening_date_1 = 'May 20 2020';% input('Please enter opening date ', 's');
 
 length_opening_date_1 = daysact(data_date(1), opening_date_1); %% The numnber of days before opening
 
 data_i_upto_opening_date_1 = data_i(1:length_opening_date_1);
 data_d_upto_opening_date_1 = data_d(1:length_opening_date_1);
 data_date_upto_opening_date_1 = data_date(1:length_opening_date_1);

 evalin('base','save myvars1.mat data_i_upto_opening_date_1 data_d_upto_opening_date_1 data_census');
 

% Do parameter estimation
multi_start_1


model_run_1


plot_vector =  x_1;

model_plot

%%

x_2_0 = [x_1(length(x_1(:, 1)), 1) x_1(length(x_1(:, 1)), 2) x_1(length(x_1(:, 1)), 3).....
    x_1(length(x_1(:, 1)), 4)  x_1(length(x_1(:, 1)), 5) x_1(length(x_1(:, 1)), 6).....
    x_1(length(x_1(:, 1)), 7) x_1(length(x_1(:, 1)), 8)]; 

opening_date_2 = 'July 10 2020';% input('Please enter opening date ', 's');
 
length_opening_date_2 = daysact(opening_date_1, opening_date_2); %% The numnber of days before opening
 


data_i_after_opening_date_2 = data_i(length_opening_date_1+1:length_opening_date_1+length_opening_date_2);
data_d_after_opening_date_2 = data_d(length_opening_date_1+1:length_opening_date_1+length_opening_date_2);
data_date_after_opening_date_2 = data_date(length_opening_date_1+1:length_opening_date_1+length_opening_date_2);
 

evalin('base','save myvars2.mat data_i_after_opening_date_2 data_d_after_opening_date_2 data_census x_2_0')


multi_start_2

model_run_2

plot_vector =  [x_1; x_2(2:length(x_2(:, 1)),:)];

model_plot
%%

x_3_0 = [x_2(length(x_2(:, 1)), 1) x_2(length(x_2(:, 1)), 2) x_2(length(x_2(:, 1)), 3).....
    x_2(length(x_2(:, 1)), 4)  x_2(length(x_2(:, 1)), 5) x_2(length(x_2(:, 1)), 6).....
    x_2(length(x_2(:, 1)), 7) x_2(length(x_2(:, 1)), 8)]; 


opening_date_3 = 'October 10 2020';


length_opening_date_3 = daysact(opening_date_2, opening_date_3); %% The numnber of days before opening
 


data_i_after_opening_date_3 = data_i(length_opening_date_1+length_opening_date_2+1:length_opening_date_1+length_opening_date_2+length_opening_date_3);
data_d_after_opening_date_3 = data_d(length_opening_date_1+length_opening_date_2+1:length_opening_date_1+length_opening_date_2+length_opening_date_3);
data_date_after_opening_date_3 = data_date(length_opening_date_1+length_opening_date_2+1:length_opening_date_1+length_opening_date_2+length_opening_date_3);



evalin('base','save myvars3.mat data_i_after_opening_date_3 data_d_after_opening_date_3 data_census x_3_0')


multi_start_3

model_run_3

plot_vector =  [x_1; x_2(2:length(x_2(:, 1)),:); x_3(2:length(x_3(:, 1)),:)];

model_plot


%%

x_4_0 = [x_3(length(x_3(:, 1)), 1) x_3(length(x_3(:, 1)), 2) x_3(length(x_3(:, 1)), 3).....
    x_3(length(x_3(:, 1)), 4)  x_3(length(x_3(:, 1)), 5) x_3(length(x_3(:, 1)), 6).....
    x_3(length(x_3(:, 1)), 7) x_3(length(x_3(:, 1)), 8)]; 
 
 

opening_date_4 = 'January 10 2021';%


length_opening_date_4 = daysact(opening_date_3, opening_date_4); %% The numnber of days before opening
 


data_i_after_opening_date_4 = data_i(length_opening_date_1+length_opening_date_2+length_opening_date_3+1:length_opening_date_1+length_opening_date_2+length_opening_date_3+length_opening_date_4);
data_d_after_opening_date_4 = data_d(length_opening_date_1+length_opening_date_2+length_opening_date_3+1:length_opening_date_1+length_opening_date_2+length_opening_date_3+length_opening_date_4);
data_date_after_opening_date_4 =data_date(length_opening_date_1+length_opening_date_2+length_opening_date_3+1:length_opening_date_1+length_opening_date_2+length_opening_date_3+length_opening_date_4);




evalin('base','save myvars4.mat data_i_after_opening_date_4 data_d_after_opening_date_4 data_census x_4_0')


multi_start_4


model_run_4

plot_vector =  [x_1; x_2(2:length(x_2(:, 1)),:); x_3(2:length(x_3(:, 1)),:); x_4(2:length(x_4(:, 1)),:)];

model_plot


%%


x_5_0 = [x_4(length(x_4(:, 1)), 1) x_4(length(x_4(:, 1)), 2) x_4(length(x_4(:, 1)), 3).....
    x_4(length(x_4(:, 1)), 4)  x_4(length(x_4(:, 1)), 5) x_4(length(x_4(:, 1)), 6).....
    x_4(length(x_4(:, 1)), 7) x_4(length(x_4(:, 1)), 8)]; 
 
 

opening_date_5 = 'February 16 2021';%


length_opening_date_5 = daysact(opening_date_4, opening_date_5); %% The numnber of days before opening
 


data_i_after_opening_date_5 = data_i(length_opening_date_1+length_opening_date_2+length_opening_date_3+length_opening_date_4+1:length_opening_date_1+length_opening_date_2+length_opening_date_3+length_opening_date_4+length_opening_date_5);
data_d_after_opening_date_5 = data_d(length_opening_date_1+length_opening_date_2+length_opening_date_3+length_opening_date_4+1:length_opening_date_1+length_opening_date_2+length_opening_date_3+length_opening_date_4+length_opening_date_5);
data_date_after_opening_date_5 =data_date(length_opening_date_1+length_opening_date_2+length_opening_date_3+length_opening_date_4+1:length_opening_date_1+length_opening_date_2+length_opening_date_3+length_opening_date_4+length_opening_date_5);




evalin('base','save myvars5.mat data_i_after_opening_date_5 data_d_after_opening_date_5 data_census x_5_0')


multi_start_5


model_run_5

plot_vector =  [x_1; x_2(2:length(x_2(:, 1)),:); x_3(2:length(x_3(:, 1)),:); x_4(2:length(x_4(:, 1)),:); x_5(2:length(x_5(:, 1)),:)];

model_plot


%%

x_6_0 = [x_5(length(x_5(:, 1)), 1) x_5(length(x_5(:, 1)), 2) x_5(length(x_5(:, 1)), 3).....
    x_5(length(x_5(:, 1)), 4)  x_5(length(x_5(:, 1)), 5) x_5(length(x_5(:, 1)), 6).....
    x_5(length(x_5(:,1)), 7) x_5(length(x_5(:, 1)), 8)]; 
 


date_to_forecasting = 'March 30 2021';
forecasting_time =  daysact(data_date(length(data_date)), date_to_forecasting);

% First scenario
scale = 1.5;  % we increase the transmisssion rate since school opening 
model_forecast; 
x_scale_1 = x_6;

% Second scenario
scale = 1; % we do not change the transmmission rate 
model_forecast; 
x_scale_2 = x_6;

% Third scenario
scale = 0.5; % we decrease the transmmission rate restrictions 
model_forecast; 
x_scale_3 = x_6;


plot_vector_1 =  [x_1; x_2(2:length(x_2(:, 1)),:); x_3(2:length(x_3(:, 1)),:); x_4(2:length(x_4(:, 1)),:); x_5(2:length(x_5(:, 1)),:) ; x_scale_1(2:length(x_scale_1(:, 1)),:)];

plot_vector_2 =  [x_1; x_2(2:length(x_2(:, 1)),:); x_3(2:length(x_3(:, 1)),:); x_4(2:length(x_4(:, 1)),:); x_5(2:length(x_5(:, 1)),:) ; x_scale_2(2:length(x_scale_2(:, 1)),:)];

plot_vector_3 =  [x_1; x_2(2:length(x_2(:, 1)),:); x_3(2:length(x_3(:, 1)),:); x_4(2:length(x_4(:, 1)),:); x_5(2:length(x_5(:, 1)),:) ; x_scale_3(2:length(x_scale_3(:, 1)),:)];
 

model_plot_final 
 


