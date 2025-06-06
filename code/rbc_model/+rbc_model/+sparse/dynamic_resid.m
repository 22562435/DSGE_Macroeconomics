function [residual, T_order, T] = dynamic_resid(y, x, params, steady_state, T_order, T)
if nargin < 6
    T_order = -1;
    T = NaN(3, 1);
end
[T_order, T] = rbc_model.sparse.dynamic_resid_tt(y, x, params, steady_state, T_order, T);
residual = NaN(8, 1);
    residual(1) = (1/y(9)) - (params(1)*1/y(17)*(1+y(21)-params(3)));
    residual(2) = (1/y(9)*y(14)) - (params(5)/(1-y(15)));
    residual(3) = (y(9)+y(10)) - (y(11));
    residual(4) = (y(13)) - (y(11)*params(2)/y(12));
    residual(5) = (y(14)) - (y(11)*(1-params(2))/y(15));
    residual(6) = (y(10)) - (y(12)-(1-params(3))*y(4));
    residual(7) = (y(11)) - (T(2)*T(3));
    residual(8) = (log(y(16))) - (params(4)*log(y(8))+x(1));
end
