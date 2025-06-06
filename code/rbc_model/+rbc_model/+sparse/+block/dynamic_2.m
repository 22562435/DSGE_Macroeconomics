function [y, T, residual, g1] = dynamic_2(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T)
residual=NaN(6, 1);
  T(1)=y(16)*y(12)^params(2);
  T(2)=y(15)^(1-params(2));
  y(11)=T(1)*T(2);
  residual(1)=(1/y(9)*y(14))-(params(5)/(1-y(15)));
  residual(2)=(y(9)+y(10))-(y(11));
  residual(3)=(y(14))-(y(11)*(1-params(2))/y(15));
  residual(4)=(y(10))-(y(12)-(1-params(3))*y(4));
  residual(5)=(y(13))-(y(11)*params(2)/y(12));
  residual(6)=(1/y(9))-(params(1)*1/y(17)*(1+y(21)-params(3)));
  T(3)=T(2)*y(16)*getPowerDeriv(y(12),params(2),1);
  T(4)=T(1)*getPowerDeriv(y(15),1-params(2),1);
if nargout > 3
    g1_v = NaN(19, 1);
g1_v(1)=1-params(3);
g1_v(2)=1/y(9);
g1_v(3)=1;
g1_v(4)=1;
g1_v(5)=1;
g1_v(6)=(-(params(5)/((1-y(15))*(1-y(15)))));
g1_v(7)=(-T(4));
g1_v(8)=(-((y(15)*(1-params(2))*T(4)-y(11)*(1-params(2)))/(y(15)*y(15))));
g1_v(9)=(-(params(2)*T(4)/y(12)));
g1_v(10)=(-T(3));
g1_v(11)=(-((1-params(2))*T(3)/y(15)));
g1_v(12)=(-1);
g1_v(13)=(-((y(12)*params(2)*T(3)-y(11)*params(2))/(y(12)*y(12))));
g1_v(14)=1;
g1_v(15)=y(14)*(-1)/(y(9)*y(9));
g1_v(16)=1;
g1_v(17)=(-1)/(y(9)*y(9));
g1_v(18)=(-(params(1)*1/y(17)));
g1_v(19)=(-((1+y(21)-params(3))*params(1)*(-1)/(y(17)*y(17))));
    if ~isoctave && matlab_ver_less_than('9.8')
        sparse_rowval = double(sparse_rowval);
        sparse_colval = double(sparse_colval);
    end
    g1 = sparse(sparse_rowval, sparse_colval, g1_v, 6, 18);
end
end
