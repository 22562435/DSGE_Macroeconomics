
/* === New Keynesian DSGE with Rotemberg Pricing === */

var c C i I M B K h Rb Rk W P Pi tau q Y Yj Pj MC A;
varexo eps_a eps_m;

parameters beta eta theta chi gamma psi delta phi epsilon alpha 
          rho_a rho_m sigma_a sigma_m;

model;
  // ====== HOUSEHOLD BLOCK ======
  // Nominal definitions
  C = P*c;
  I = P*i;

  // Budget constraint
  C + I + B + M = Rb(-1)*B(-1) + M(-1) + W*h + Rk(-1)*K(-1) + Pi - P*tau;

  // Capital accumulation with adjustment costs
  K = (1-delta)*K(-1) + I - (phi/2)*((I/K(-1)-delta)^2)*K(-1);

  // Consumption Euler with habit formation
  (c-eta*c(-1))^(-theta) = beta*E(Rb*(P/P(+1))*(c(+1)-eta*c)^(-theta));

  // Labour supply
  W/P = chi*h^gamma / 
        ((c-eta*c(-1))^(-theta) - beta*eta*E((c(+1)-eta*c)^(-theta)));

  // Money demand
  M = psi / (beta*E((Rb-1)*(
        ((c(+1)-eta*c)^(-theta) - beta*eta*E((c(+2)-eta*c(+1))^(-theta))
      )/P(+1)));

  // Tobin's q and capital Euler
  q = 1 - phi*(I/K(-1) - delta);
  beta*E( (c(+1)-eta*c)^(-theta) * Rb ) / q = 
  beta*E( (c(+1)-eta*c)^(-theta) * (
      Rk(+1) + (1/q(+1))*(1 - delta + (phi/2)*((I(+1)/K)^2 - delta^2)
  ));

  // ====== PRODUCTION BLOCK ======
  // Final goods aggregator (symmetric equilibrium)
  Y = Yj;  
  P = Pj;
  
  // Intermediate goods production
  Yj = A*(K(-1)^alpha)*(h^(1-alpha));  // Capital is predetermined
  
  // Marginal cost
  MC = (1/A)*((Rk/alpha)^alpha)*((W/(1-alpha))^(1-alpha));
  
  // Rotemberg price adjustment (NKPC)
  # pi = P/P(-1);  // Inflation definition
  (pi - 1)*pi = (epsilon/psi)*(MC/P - (epsilon-1)/epsilon) + 
                beta*E( 
                  ((c(+1)-eta*c)^(-theta)/((c-eta*c(-1))^(-theta)) * 
                  (Y(+1)/Y) * 
                  (pi(+1) - 1)*pi(+1) 
                );

  // Real profits
  Pi = P * [Y - (MC/P)*Y - (psi/2)*(pi - 1)^2 * Y];

  // ====== GOVERNMENT & CLEARING ======
  // Fiscal policy (lump-sum taxes)
  tau = 0;  // Placeholder - to be specified
  
  // Bond market clearing
  B = 0;  // Zero net supply
  
  // Resource constraint
  Y = c + i + (psi/2)*(pi - 1)^2 * Y;

  // ====== EXOGENOUS PROCESSES ======
  // TFP shock (log-linear)
  log(A) = rho_a*log(A(-1)) + sigma_a*eps_a;
end;

shocks;
  var eps_a; stderr sigma_a;
  var eps_m; stderr sigma_m;
end;

