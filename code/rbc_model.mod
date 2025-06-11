%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% RBC model with Labor and Log Utility 
% Based on image equations (10)–(17)
% Corrected for B&K conditions (loglinear TFP)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

var C               // Consumption
    I               // Investment
    Y               // Output
    K               // Capital stock
    R               // Return on Capital
    W               // Wage
    H               // Hours worked
    A;              // Productivity level

varexo eps;         // TFP shock

parameters beta alpha delta rho chi;

beta  = 0.99;       // Discount factor
alpha = 0.33;       // Capital share
delta = 0.025;      // Depreciation rate
rho   = 0.95;       // TFP shock persistence
chi   = 2.24;       // Labor disutility parameter

model;
    // (10) Euler equation
    1/C = beta * (1/C(+1)) * (R(+1) + 1 - delta);

    // (11) Labor-leisure trade-off
    (1/C) * W = chi / (1 - H);

    // (12) Resource constraint
    C + I = Y;

    // (13) Return on capital
    R = alpha * Y / K;

    // (14) Wage equation
    W = (1 - alpha) * Y / H;

    // (15) Capital accumulation
    I = K - (1 - delta) * K(-1);

    // (16) Cobb-Douglas production
    Y = A * K^alpha * H^(1 - alpha);

    // (17) Log TFP process
    log(A) = rho * log(A(-1)) + eps;
end;

initval;
    A = 1;
    K = ((alpha * beta / (1 - beta * (1 - delta)))^(1/(1 - alpha)));
    H = 0.33;
    Y = A * K^alpha * H^(1 - alpha);
    I = delta * K;
    C = Y - I;
    R = alpha * Y / K;
    W = (1 - alpha) * Y / H;
end;


steady;
check;
resid;

shocks;
    var eps = 0.01^2; // 1% standard deviation TFP shock
 end;

stoch_simul(order=1, irf=40, hp_filter=1600, loglinear,graph_format=fig) Y C I K H W A R;
