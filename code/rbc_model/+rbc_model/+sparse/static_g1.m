function [g1, T_order, T] = static_g1(y, x, params, sparse_rowval, sparse_colval, sparse_colptr, T_order, T)
if nargin < 8
    T_order = -1;
    T = NaN(4, 1);
end
[T_order, T] = rbc_model.sparse.static_g1_tt(y, x, params, T_order, T);
g1_v = NaN(21, 1);
g1_v(1)=(-1)/(y(1)*y(1))-(1+y(5)-params(3))*params(1)*(-1)/(y(1)*y(1));
g1_v(2)=y(6)*(-1)/(y(1)*y(1));
g1_v(3)=1;
g1_v(4)=1;
g1_v(5)=1;
g1_v(6)=(-1);
g1_v(7)=(-(params(2)/y(4)));
g1_v(8)=(-((1-params(2))/y(7)));
g1_v(9)=1;
g1_v(10)=(-((-(y(3)*params(2)))/(y(4)*y(4))));
g1_v(11)=(-(1-(1-params(3))));
g1_v(12)=(-(T(4)*y(8)*getPowerDeriv(y(4),params(2),1)));
g1_v(13)=(-(T(1)*params(1)));
g1_v(14)=1;
g1_v(15)=T(1);
g1_v(16)=1;
g1_v(17)=(-(params(5)/((1-y(7))*(1-y(7)))));
g1_v(18)=(-((-(y(3)*(1-params(2))))/(y(7)*y(7))));
g1_v(19)=(-(T(3)*getPowerDeriv(y(7),1-params(2),1)));
g1_v(20)=(-(T(2)*T(4)));
g1_v(21)=1/y(8)-params(4)*1/y(8);
if ~isoctave && matlab_ver_less_than('9.8')
    sparse_rowval = double(sparse_rowval);
    sparse_colval = double(sparse_colval);
end
g1 = sparse(sparse_rowval, sparse_colval, g1_v, 8, 8);
end
