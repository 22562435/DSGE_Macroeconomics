function [g1, T_order, T] = dynamic_g1(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T_order, T)
if nargin < 9
    T_order = -1;
    T = NaN(3, 1);
end
[T_order, T] = rbc_model.sparse.dynamic_g1_tt(y, x, params, steady_state, T_order, T);
g1_v = NaN(25, 1);
g1_v(1)=1-params(3);
g1_v(2)=(-(params(4)*1/y(8)));
g1_v(3)=(-1)/(y(9)*y(9));
g1_v(4)=y(14)*(-1)/(y(9)*y(9));
g1_v(5)=1;
g1_v(6)=1;
g1_v(7)=1;
g1_v(8)=(-1);
g1_v(9)=(-(params(2)/y(12)));
g1_v(10)=(-((1-params(2))/y(15)));
g1_v(11)=1;
g1_v(12)=(-((-(y(11)*params(2)))/(y(12)*y(12))));
g1_v(13)=(-1);
g1_v(14)=(-(T(3)*y(16)*getPowerDeriv(y(12),params(2),1)));
g1_v(15)=1;
g1_v(16)=1/y(9);
g1_v(17)=1;
g1_v(18)=(-(params(5)/((1-y(15))*(1-y(15)))));
g1_v(19)=(-((-(y(11)*(1-params(2))))/(y(15)*y(15))));
g1_v(20)=(-(T(2)*getPowerDeriv(y(15),1-params(2),1)));
g1_v(21)=(-(T(1)*T(3)));
g1_v(22)=1/y(16);
g1_v(23)=(-((1+y(21)-params(3))*params(1)*(-1)/(y(17)*y(17))));
g1_v(24)=(-(params(1)*1/y(17)));
g1_v(25)=(-1);
if ~isoctave && matlab_ver_less_than('9.8')
    sparse_rowval = double(sparse_rowval);
    sparse_colval = double(sparse_colval);
end
g1 = sparse(sparse_rowval, sparse_colval, g1_v, 8, 25);
end
