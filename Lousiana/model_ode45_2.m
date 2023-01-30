function value = model_ode45_2(z)

global value

load('myvars2.mat', 'data_i_after_opening_date_2', 'data_d_after_opening_date_2', 'data_census', 'x_2_0')



% Set the initial conditions 


% Set the initial conditions 
S = x_2_0(1)+x_2_0(2)*z(1);
SQ = x_2_0(2)*(1-z(1));
E = x_2_0(3);
I = x_2_0(4);
IQ = x_2_0(5);
R = x_2_0(6);

D = x_2_0(7);
C = x_2_0(8);




% time for existing data
T =  length(data_i_after_opening_date_2);
N = T;
tvec=linspace(0,T,N)';


    
  % % ODE45
[t,x] = ode45(@(t,x) model_states_2(x,z,data_census),tvec,[S, SQ, E, I, IQ, R, D, C]);
  
  

  CD=x(:,7);
  CC=x(:,8);

 
 dif_i = data_i_after_opening_date_2-CC;
 dif_d = data_d_after_opening_date_2-CD;

 
value = norm(dif_i, 2)/norm(data_i_after_opening_date_2,2)+norm(dif_d,2)/norm(data_d_after_opening_date_2,2);

end           
         
