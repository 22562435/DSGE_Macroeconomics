function g1 = static_g1(T, y, x, params, T_flag)
% function g1 = static_g1(T, y, x, params, T_flag)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T         [#temp variables by 1]  double   vector of temporary terms to be filled by function
%   y         [M_.endo_nbr by 1]      double   vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1]       double   vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1]     double   vector of parameter values in declaration order
%                                              to evaluate the model
%   T_flag    boolean                 boolean  flag saying whether or not to calculate temporary terms
%
% Output:
%   g1
%

if T_flag
    T = rbc_model.static_g1_tt(T, y, x, params);
end
g1 = zeros(8, 8);
g1(1,1)=(-1)/(y(1)*y(1))-(1+y(5)-params(3))*params(1)*(-1)/(y(1)*y(1));
g1(1,5)=(-(T(1)*params(1)));
g1(2,1)=y(6)*(-1)/(y(1)*y(1));
g1(2,6)=T(1);
g1(2,7)=(-(params(5)/((1-y(7))*(1-y(7)))));
g1(3,1)=1;
g1(3,2)=1;
g1(3,3)=(-1);
g1(4,3)=(-(params(2)/y(4)));
g1(4,4)=(-((-(y(3)*params(2)))/(y(4)*y(4))));
g1(4,5)=1;
g1(5,3)=(-((1-params(2))/y(7)));
g1(5,6)=1;
g1(5,7)=(-((-(y(3)*(1-params(2))))/(y(7)*y(7))));
g1(6,2)=1;
g1(6,4)=(-(1-(1-params(3))));
g1(7,3)=1;
g1(7,4)=(-(T(4)*y(8)*getPowerDeriv(y(4),params(2),1)));
g1(7,7)=(-(T(3)*getPowerDeriv(y(7),1-params(2),1)));
g1(7,8)=(-(T(2)*T(4)));
g1(8,8)=1/y(8)-params(4)*1/y(8);

end
