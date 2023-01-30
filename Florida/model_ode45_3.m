function value = model_ode45_3(z)

global value

load('myvars3.mat', 'data_i_after_opening_date_3', 'data_d_after_opening_date_3', 'data_census', 'x_3_0')



% Set the initial conditions 


% Set the initial conditions 
S = x_3_0(1);
SQ = x_3_0(2);
E = x_3_0(3);
I = x_3_0(4);
IQ = x_3_0(5);
R = x_3_0(6);

D = x_3_0(7);
C = x_3_0(8);




% time for existing data
T =  length(data_i_after_opening_date_3);
N = T;
tvec=linspace(0,T,N)';


    
  % % ODE45
[t,x] = ode45(@(t,x) model_states_3(x,z,data_census),tvec,[S, SQ, E, I, IQ, R, D, C]);
  
  

  CD=x(:,7);
  CC=x(:,8);

 
 dif_i = data_i_after_opening_date_3-CC;
 dif_d = data_d_after_opening_date_3-CD;

 
value = norm(dif_i, 2)/norm(data_i_after_opening_date_3,2)+norm(dif_d,2)/norm(data_d_after_opening_date_3,2);

end           
         
