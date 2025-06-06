function [T_order, T] = static_resid_tt(y, x, params, T_order, T)
if T_order >= 0
    return
end
T_order = 0;
if size(T, 1) < 4
    T = [T; NaN(4 - size(T, 1), 1)];
end
T(1) = 1/y(1);
T(2) = y(4)^params(2);
T(3) = y(8)*T(2);
T(4) = y(7)^(1-params(2));
end
