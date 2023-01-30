% This code solve the sytem of differential equation


% Set the time 

 

 timeperiod_impulse = length(data_i_after_opening_date_2);
 proportion_move_susceptible = ModelParamaters2(1, 1);
    

% Set the initial conditions 
S = x_2_0(1)+x_2_0(2)*proportion_move_susceptible;
SQ = x_2_0(2)*(1-proportion_move_susceptible);
E =  x_2_0(3);
I =  x_2_0(4);
IQ =  x_2_0(5);
R = x_2_0(6);

D = x_2_0(7);
C = x_2_0(8);



beta =  ModelParamaters2(1, 2);
r =  ModelParamaters2(1, 3);
mu_q = ModelParamaters2(1, 4);
i_q =  ModelParamaters2(1, 5);
gamma_q = ModelParamaters2(1, 6);
mu_i = ModelParamaters2(1, 7);

gamma_i = 0.111;
d = 8.6/(1000*365);
alpha =  0.2381;
pi = data_census*11.6/(1000*365);
%mu_i = 0.0096;

%Set the parameters 


x0=[S, SQ, E, I, IQ, R, D, C];


tvec=linspace(0, timeperiod_impulse, timeperiod_impulse)';

   solx = ode45(@(t,x)model_solution_2(x, beta, gamma_i, gamma_q, mu_i, r, d, alpha, pi, mu_q, i_q),tvec,x0);
   x_2 = deval(solx,tvec)';
           