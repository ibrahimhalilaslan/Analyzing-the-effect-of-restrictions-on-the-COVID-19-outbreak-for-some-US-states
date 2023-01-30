% This code solve the sytem of differential equation

% load necessary data 

% Set the time 
timeperiod = length(data_i_upto_opening_date_1);
 
% Set the initial conditions 
S = data_census;
SQ = 0;
E =  data_i_upto_opening_date_1(6);
IQ =  data_i_upto_opening_date_1(1);
I = data_i_upto_opening_date_1(2);
R = 0;

D = 0;
C = data_i_upto_opening_date_1(1);


s_q = ModelParamaters1(1,1);
beta = ModelParamaters1(1,2);
r = ModelParamaters1(1,3);
i_q = ModelParamaters1(1,4);
q_s = ModelParamaters1(1,5);
mu_q = ModelParamaters1(1,6);
gamma_q = ModelParamaters1(1,7);


gamma_i = 0.111;
mu_i = 0.0096;


%Set the parameters 

pi = data_census*11.6/(1000*365);
d = 8.6/(1000*365);
alpha =  0.2381;





x0=[S, SQ, E, I, IQ, R, D, C];


tvec=linspace(0, timeperiod, timeperiod)';

        solx = ode45(@(t,x)model_solution_1(x, q_s, s_q, beta, gamma_i, gamma_q, mu_i, r, d, alpha, pi, mu_q, i_q),tvec,x0);
        x_1 = deval(solx,tvec)';
           