

// Endogenous Variables

var pi y R real_R mc r_n z u v pi_annual y_annual R_annual real_R_annual mc_annual z_annual u_annual v_annual;

// Exogenous Variables (Shocks)

varexo e_z e_u e_v;

// Parameters and Calibration

parameters beta R_ss varphi epsilon theta k rho phi_pi phi_y vartheta delta;

//Below are the parameter values and steady states of the model

beta=0.995;
R_ss=1/beta;
varphi=1;
epsilon=6;
theta=200;
k=((epsilon-1)*(1+varphi))/theta;
rho=0;
phi_pi=1.5;
phi_y=0;

vartheta=(1+varphi)/theta; 

delta=1;  //Dummy variable for commitment versus discretion. 0 for discretion, 1 for commitment

model (linear);

//All interest rates written in gross terms. Model written already in log-linear form. 


pi=beta*pi(1)+k*y+u;

y=y(1)-(R-pi(1)-r_n);

y-delta*y(-1)=-(k/vartheta)*pi;              //optimal target rule under discretion (delta=0) and commitment (delta=1)

real_R=R-pi(1);

mc=(1+varphi)*y;

r_n=z-z(1);

z=rho*z(-1)-e_z;

u=rho*u(-1)+e_u;

v=rho*v(-1)+e_v;

y_annual=100*y;

pi_annual=400*pi;

R_annual=400*R;

real_R_annual=400*real_R;

mc_annual=100*mc; 

z_annual=100*z;

u_annual=100*u;

v_annual=100*v; 




end;



shocks;

var e_z; stderr 0;

var e_u; stderr 0.01;

var e_v; stderr 0;
end;


stoch_simul( order = 1, irf = 30) pi_annual y_annual R_annual real_R_annual mc_annual u;

