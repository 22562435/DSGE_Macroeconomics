function [T_order, T] = dynamic_resid_tt(y, x, params, steady_state, T_order, T)
if T_order >= 0
    return
end
T_order = 0;
if size(T, 1) < 3
    T = [T; NaN(3 - size(T, 1), 1)];
end
T(1) = y(12)^params(2);
T(2) = y(16)*T(1);
T(3) = y(15)^(1-params(2));
end
