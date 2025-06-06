function [residual, T_order, T] = static_resid(y, x, params, T_order, T)
if nargin < 5
    T_order = -1;
    T = NaN(4, 1);
end
[T_order, T] = rbc_model.sparse.static_resid_tt(y, x, params, T_order, T);
residual = NaN(8, 1);
    residual(1) = (T(1)) - (T(1)*params(1)*(1+y(5)-params(3)));
    residual(2) = (T(1)*y(6)) - (params(5)/(1-y(7)));
    residual(3) = (y(1)+y(2)) - (y(3));
    residual(4) = (y(5)) - (y(3)*params(2)/y(4));
    residual(5) = (y(6)) - (y(3)*(1-params(2))/y(7));
    residual(6) = (y(2)) - (y(4)-y(4)*(1-params(3)));
    residual(7) = (y(3)) - (T(3)*T(4));
    residual(8) = (log(y(8))) - (log(y(8))*params(4)+x(1));
end
