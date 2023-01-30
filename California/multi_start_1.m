
%clear all

%Set the parameters 
%LowerBounds = [s_q_l    beta_l    r_l        i_q_l        d_s_l    mu_q_l   gamma_q_l];
%UpperBounds = [s_q_u    beta_u    r_u        i_q_u        d_s_u    mu_q_u   gamma_q_u];

LowerBounds = [0.001,     0.5,      0.08,       0.2,          1,       0.0001     0.08];
UpperBounds = [0.2,         8,      0.25,       0.28,         2.5,     0.02      0.15];

xstar=0.5*(LowerBounds + UpperBounds); % initial guesses for parameters

%% %  Optimization Function fmincon  % % % % %
problem=createOptimProblem('fmincon','x0',xstar, 'objective',@model_ode45_1...
         ,'lb',LowerBounds,'ub',UpperBounds);

problem.options=optimoptions(problem.options, 'MaxFunEvals',5000,'MaxIter',500);


numstartpoints = 5;

ms = MultiStart('Display', 'iter'); % Define a multistar problem

[x,fval, exitflag, output, manymins]=run(ms,problem,numstartpoints);

global ModelParamaters1

for i=1: length(manymins) 
    ModelParamaters1(i,:)=manymins(i).X; %% model parameters
end

for i=1: length(manymins) 
    fval(i)=manymins(i).Fval;  %% min of objective functional
end 
fval=fval';         

for i=1: length(manymins) 
    EF(i)=manymins(i).Exitflag;  %% must be positive 1 or 2
end
EF=EF';

ModelParamaters1;

beep on;
beep
beep
beep
beep
beep
beep


