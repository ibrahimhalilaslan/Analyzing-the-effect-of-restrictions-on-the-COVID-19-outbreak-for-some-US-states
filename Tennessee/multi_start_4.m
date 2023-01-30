%Set the parameters 
             %[beta       r       mu_q        i_q       gamma_q     mu_i];
LowerBounds = [1         0.15     0.00014      0.1         0.08    0.00014];
UpperBounds = [7         0.4      0.2          0.4          0.2        0.2];

 xstar=0.5*(LowerBounds + UpperBounds); % initial guesses for parameters
 
% % % % %  Optimization Function fmincon  % % % % %
problem=createOptimProblem('fmincon','x0',xstar, 'objective',@model_ode45_4...
         ,'lb',LowerBounds,'ub',UpperBounds);

problem.options=optimoptions(problem.options, 'MaxFunEvals',5000,'MaxIter',500);


numstartpoints=5;

ms=MultiStart('Display', 'iter'); % Define a multistar problem

[x,fval, exitflag, output, manymins]=run(ms,problem,numstartpoints);

global ModelParamaters4

for i=1: length(manymins) 
    ModelParamaters4(i,:)=manymins(i).X; %% model parameters
end

for i=1: length(manymins) 
    fval(i)=manymins(i).Fval;  %% min of objective functional
end 
fval=fval';         

for i=1: length(manymins) 
    EF(i)=manymins(i).Exitflag;  %% must be positive 1 or 2
end
EF=EF';

ModelParamaters4;

beep on;
beep
beep
beep
beep
beep
beep


