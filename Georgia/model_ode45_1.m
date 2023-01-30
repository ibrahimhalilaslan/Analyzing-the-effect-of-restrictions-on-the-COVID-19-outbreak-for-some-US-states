function value = model_ode45_1(z)

global value

load('myvars1.mat', 'data_i_upto_opening_date_1', 'data_d_upto_opening_date_1', 'data_census')

% Set the initial conditions 

S = data_census;
SQ = 0;
E = data_i_upto_opening_date_1(6);
IQ = data_i_upto_opening_date_1(1);
I = data_i_upto_opening_date_1(2);
R = 0;

D = data_d_upto_opening_date_1(1);
C = data_i_upto_opening_date_1(1);


% time for existing data


T = length(data_i_upto_opening_date_1);
N = T;
tvec=linspace(0,T,N)';


    
  % % ODE45
  [t,x ] = ode45(@(t,x) model_states_1(x,z,data_census),tvec,[S, SQ, E, I, IQ, R, D, C]);

  CD = x(:,7);
  CC = x(:,8);
 

 dif_d = data_d_upto_opening_date_1-CD;
 dif_i = data_i_upto_opening_date_1-CC;

  
% the difference between estimated value and data 
value = norm(dif_i, 2)/norm(data_i_upto_opening_date_1, 2)+norm(dif_d,2)/norm(data_d_upto_opening_date_1,2);

    
end           
         