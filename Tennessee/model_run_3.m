% This code solve the sytem of differential equation


% Set the time 

 

 timeperiod_impulse = length(data_i_after_opening_date_3);
 
% Set the initial conditions 
S = x_3_0(1);
SQ = x_3_0(2);
E =  x_3_0(3);
I =  x_3_0(4);
IQ =  x_3_0(5);
R = x_3_0(6);

D = x_3_0(7);
C = x_3_0(8);



beta =  ModelParamaters3(1, 1);
r =  ModelParamaters3(1, 2);
mu_q = ModelParamaters3(1, 3);
i_q =  ModelParamaters3(1, 4);
gamma_q = ModelParamaters3(1, 5);
mu_i = ModelParamaters3(1, 6);

gamma_i = 0.111;
d = 8.6/(1000*365);
alpha =  0.2381;
pi = data_census*11.6/(1000*365);
%mu_i = 0.0096;

%Set the parameters 


x0=[S, SQ, E, I, IQ, R, D, C];


tvec=linspace(0, timeperiod_impulse, timeperiod_impulse)';

   solx = ode45(@(t,x)model_solution_2(x, beta, gamma_i, gamma_q, mu_i, r, d, alpha, pi, mu_q, i_q),tvec,x0);
   x_3 = deval(solx,tvec)';
           