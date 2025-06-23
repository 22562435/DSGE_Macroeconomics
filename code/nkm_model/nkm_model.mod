// DSGE Model for Dynare (Final)
var 
    pi          // Inflation (π_t)
    c           // Real consumption
    i           // Real investment
    g           // Real government spending
    b           // Real bonds
    h           // Hours worked
    K           // Capital stock
    lambda      // Lagrangian multiplier
    mu          // Capital multiplier
    Y           // Output
    mc          // Real marginal cost
    R           // Nominal interest rate
    tau         // Real taxes
    A           // Technology
    W           // Nominal wage
    Rk          // Nominal return on capital
    P           // Price level
    ;

varexo
    eps_R       // Monetary policy shock
    eps_tau     // Tax shock
    eps_g       // Government spending shock
    eps_a       // Technology shock
    ;

parameters
    beta        eta         theta       chi         gamma      
    alpha       delta       epsilon     phi_k       psi_p      
    rho_R       phi_pi      phi_y       pi_star     R_star     
    rho_tau     tau_bar     rho_g       g_bar       rho_a       
    Y_star      rk_star     ;

// Parameter Calibration
beta = 0.99;
eta = 0.7;
theta = 2.0;
chi = 1.5;
gamma = 2.0;
alpha = 0.33;
delta = 0.025;
epsilon = 6.0;
phi_k = 2.0;
psi_p = 100;
rho_R = 0.8;
phi_pi = 1.5;
phi_y = 0.1;
pi_star = 1.00;
rho_tau = 0.9;
tau_bar = 0.20;
rho_g = 0.9;
g_bar = 0.20;
rho_a = 0.9;
R_star = pi_star/beta;       // Eq(25)
rk_star = 1/beta - (1-delta); // Eq(26)
Y_star = 1.0;                // Normalized output

model;
    ///////////////
    // Equations //
    ///////////////
    
    // Inflation definition (eq1)
    pi = P / P(-1);
    
    // FOC Consumption (eq5)
    lambda * P = (c - eta*c(-1))^(-theta) - beta*eta*(c(1) - eta*c)^(-theta);
    
    // FOC Labor (eq6)
    lambda * W = chi * h^gamma;
    
    // FOC Bonds (eq8)
    lambda = beta * lambda(1) * R;
    
    // FOC Investment (eq9)
    lambda * P = mu * (1 - phi_k*(i/K(-1) - delta));
    
    // FOC Capital (eq10)
    mu = beta * ( 
        lambda(1) * Rk(1) / P(1) 
        + mu(1) * ( 
            (1 - delta) 
            + phi_k/2 * ((i(1)/K)^2 - delta^2) 
        ) 
    );
    
    // Capital accumulation (eq4)
    K = (1 - delta)*K(-1) + i - (phi_k/2)*(i/K(-1) - delta)^2 * K(-1);
    
    // Production function (eq12)
    Y = A * K(-1)^alpha * h^(1 - alpha);
    
    // Factor demand - Capital (eq14)
    Rk = (Y * mc * alpha * P) / K(-1);
    
    // Factor demand - Labor (eq15)
    W = (Y * mc * P * (1 - alpha)) / h;
    
    // NK Phillips Curve (eq18)
    (pi - 1)*pi = (epsilon/psi_p) * (mc - (epsilon-1)/epsilon) 
                 + beta * (lambda(1)/lambda) * (Y(1)/Y) * (pi(1) - 1)*pi(1);
    
    // Government budget constraint (REAL terms)
    g + (R(-1)/pi) * b(-1) = b + tau;
    
    // Resource constraint (eq21)
    Y = c + i + g + (phi_k/2)*(i/K(-1) - delta)^2 * K(-1) + (psi_p/2)*(pi - 1)^2 * Y;
    
    // Taylor rule (eq21)
    R = rho_R * R(-1) + (1 - rho_R) * (R_star + phi_pi*(pi - pi_star) + phi_y*((Y - Y_star)/Y_star)) + eps_R;
    
    // Tax process (eq22)
    tau = (1 - rho_tau)*tau_bar + rho_tau * tau(-1) + eps_tau;
    
    // Gov spending process (eq23)
    g = (1 - rho_g)*g_bar + rho_g * g(-1) + eps_g;
    
    // Technology process (eq24)
    log(A) = rho_a * log(A(-1)) + eps_a;
end;

// Steady-state initialization
initval;
    // Exogenous
    A = 1;
    
    // Prices
    P = 1;
    pi = pi_star;
    R = R_star;
    mc = (epsilon - 1)/epsilon;  // From NKPC
    
    // Production
    Y = Y_star;
    K = Y_star * (alpha * mc / rk_star); // Capital demand
    h = (Y / (A * K^alpha))^(1/(1-alpha));
    i = delta * K;
    
    // Government
    g = g_bar;
    tau = tau_bar;
    b = (tau - g) / (1 - 1/beta); // Gov budget
    
    // Consumption
    c = Y - i - g; // Resource constraint
    
    // Multipliers
    lambda = (c*(1-eta))^(-theta) * (1 - beta*eta) / P;
    mu = lambda * P;
    
    // Factor prices
    W = (Y * mc * P * (1 - alpha)) / h;
    Rk = rk_star * P;
end;

// Set solver tolerance
options_.solve_tolf = 1e-8;
steady(maxit=1000);  // Numerical steady-state solution

// Shocks specification
shocks;
    var eps_R = 0.01^2;    // 1% monetary policy shock
    var eps_tau = 0.01^2;  // 1% tax shock
    var eps_g = 0.01^2;    // 1% spending shock
    var eps_a = 0.01^2;    // 1% technology shock
end;

stoch_simul(order=1, irf=20);
