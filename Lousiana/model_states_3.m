% This function solves the system of dynamic system 

function [dx] = model_states_3(x, z, data_census)

beta = z(1);
r = z(2);
mu_q = z(3);
i_q = z(4);
gamma_q = z(5);
mu_i = z(6);


gamma_i = 0.111;
%mu_i = 0.0096;


%Set the parameters 

pi = data_census*11.6/(1000*365);
d = 8.6/(1000*365);
alpha =  0.2381;


dx = zeros(8,1);


dx(1) = pi-beta*x(4)*x(1)/(x(1)+x(2)+x(3)+x(4)+x(5)+x(6))-d*x(1);
dx(2) = -r*beta*x(4)*x(2)/(x(1)+x(2)+x(3)+x(4)+x(5)+x(6))-d*x(2);
dx(3) = beta*x(4)*x(1)/(x(1)+x(2)+x(3)+x(4)+x(5)+x(6))+r*beta*x(4)*x(2)/(x(1)+x(2)+x(3)+x(4)+x(5)+x(6))-(alpha+d)*x(3);
dx(4) = alpha*x(3)-(i_q+gamma_i+mu_i+d)*x(4);
dx(5) = i_q*x(4)-(gamma_q+mu_q+d)*x(5);
dx(6) = gamma_i*x(4)+gamma_q*x(5)-d*x(6);

dx(7) = mu_i*x(4)+mu_q*x(5)+d*x(4); % cum deaths
dx(8) = i_q*x(4)+ mu_i*x(4)+d*x(4); % cumulative cases

end

