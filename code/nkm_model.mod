



var 
    c i b m h K lambda mu 
    Y w rk Pi_r mc pi 
    g tau d 
    R rB A;

varexo 
    epsilon_a epsilon_g epsilon_tau epsilon_R;

parameters 
    alpha beta delta phi_k phi_p eta theta gamma chi psi epsilon 
    rho_R R_star kappa_pi pi_star kappa_y Y_star 
    rho_g g_bar 
    rho_tau tau_bar 
    rho_a;

alpha     = 0.33;
beta      = 0.99;
delta     = 0.025;
phi_k     = 0;
phi_p     = 50;
eta       = 0;
theta     = 2;
gamma     = 1;
chi       = 1;
psi       = 1;
epsilon   = 6;

rho_R     = 0.8;
R_star    = 1/beta;
pi_star   = 1;
kappa_pi  = 1.2;
kappa_y   = 0;
Y_star    = 1;

rho_g     = 0.9;
g_bar     = 0.2;

rho_tau   = 0.9;
tau_bar   = 0.2;

rho_a     = 0.9;

model;

// 1. Household flow constraint
c + i + b + m = rB(-1)*b(-1) + m(-1)/pi + w*h + rk*K(-1) + Pi_r - tau;

// 2. Capital accumulation
K = (1 - delta)*K(-1) + i - (phi_k/2)*((i/K(-1) - delta)^2)*K(-1);

// 3. Profit
Pi_r = Y - rk*K(-1) - w*h - (phi_p/2)*(pi - 1)^2*Y;

// 4. FOC consumption
lambda = (c - eta*c(-1))^(-theta) - beta*eta*((c(+1) - eta*c)^(-theta));

// 5. FOC labour
h^gamma = lambda*w / chi;

// 6. FOC bonds
1 = beta*(lambda(+1)/lambda)*rB;

// 7. FOC money
lambda = psi/m + beta*(lambda(+1)/pi(+1));

// 8. FOC investment
mu = lambda / (1 - phi_k*(i/K(-1) - delta));

// 9. FOC capital
1 = beta*( (lambda(+1)/mu)*(rk(+1)) + (mu(+1)/mu)*(1 - delta - (phi_k/2)*(delta^2 - (i(+1)/K)^2)) );

// 10. Production
Y = A*K(-1)^alpha*h^(1 - alpha);


// 11. NK Phillips Curve
(pi - 1)*pi = (epsilon/phi_p)*(mc - (epsilon - 1)/epsilon) + beta*(lambda(+1)/lambda)*(Y(+1)/Y)*(pi(+1) - 1)*pi(+1);

// 12. Marginal cost
mc = (1/A)*((rk/alpha)^alpha)*((w/(1 - alpha))^(1 - alpha));

// 13. Government budget
g + rB(-1)*d(-1) = d + tau;

// 14. Resource constraint
Y = c + i + g + (phi_k/2)*((i/K(-1) - delta)^2)*K(-1) + (phi_p/2)*(pi - 1)^2*Y;

// 15. Bond market clearing
b = d;

// 16. Fisher equation
R = rB * pi(+1);

// 17. Taylor rule
R = rho_R*R(-1) + (1 - rho_R)*(R_star + kappa_pi*(pi - pi_star) + kappa_y*((Y - Y_star)/Y_star)) + epsilon_R;

// 18. Taxes
tau = (1 - rho_tau)*tau_bar + rho_tau*tau(-1) + epsilon_tau;

// 19. Government spending
g = (1 - rho_g)*g_bar + rho_g*g(-1) + epsilon_g;

// 20. Technology process
log(A) = rho_a*log(A(-1)) + epsilon_a;

end;

initval;
    c = 1.43; 
    i = 0.397; 
    b = 0; 
    m = 0.5;    // Initial guess, will be updated
    h = 0.733; 
    K = 15.88; 
    lambda = 0.489; 
    mu = 0.489; 
    Y = 2.027; 
    w = 1.54; 
    rk = 0.0351; 
    Pi_r = 0.1;  // Initial guess
    mc = 0.8333; 
    pi = 1; 
    g = 0.2; 
    tau = 0.2; 
    d = 0; 
    R = 1.0101; 
    rB = 1.0101; 
    A = 1;
end;

shocks;
    var epsilon_a; stderr 0.01;
    var epsilon_g; stderr 0.01;
    var epsilon_tau; stderr 0.01;
    var epsilon_R; stderr 0.01;
end;

steady;
check;
stoch_simul(order=1,irf=10);




