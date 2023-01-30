% This function solves the system of dynamic system 

function [dx] = model_solution_2(x, beta, gamma_i, gamma_q, mu_i, r, d, alpha, pi, mu_q, i_q)
 

dx = zeros(8,1);


dx(1) = pi-beta*x(4)*x(1)/(x(1)+x(2)+x(3)+x(4)+x(5)+x(6))-d*x(1);
dx(2) = -r*beta*x(4)*x(2)/(x(1)+x(2)+x(3)+x(4)+x(5)+x(6))-d*x(2);
dx(3) = beta*x(4)*x(1)/(x(1)+x(2)+x(3)+x(4)+x(5)+x(6))+r*beta*x(4)*x(2)/(x(1)+x(2)+x(3)+x(4)+x(5)+x(6))-(alpha+d)*x(3);
dx(4) = alpha*x(3)-(i_q+gamma_i+mu_i+d)*x(4);
dx(5) = i_q*x(4)-(gamma_q+mu_q+d)*x(5);
dx(6) = gamma_i*x(4)+gamma_q*x(5)-d*x(6);


dx(7) = mu_i*x(4)+mu_q*x(5); % cumulative deaths
dx(8)= i_q*x(4)+ mu_i*x(4)+ d*x(4); % cumulative cases


end

