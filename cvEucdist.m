%description
%cvEucdist calculates a squared euclidean distance between X and Y
% Example
% x=[1 2
%    1 2];
% Y=[1 2 3
%    1 2 3];
% d=cvEucdist(X,Y)
% % 0 2 8
% % 2 0 2
function d=cvEucdist(X,Y)
if ~exist('Y','var')||isempty(Y)
    %var 表示变量
    U=ones(size(X,1),1);
    d=abs(X'.^2*U).';%数值计算'与.'没有区别
    return;
end
V=~isnan(X);
X(~V)=0;
U=~isnan(Y);
Y(~U)=0;
d1=X'.^2*U;
d3=V'*Y.^2;
d2=X'*Y;
d=abs(d1-2*d2+d3);



















