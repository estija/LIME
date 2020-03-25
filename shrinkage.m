function [S] = shrinkage(A,X)
%performing shrinkage operation

%A is matrix for thresholds
%X is matrix for shrinkage

%S is the resultant matrix

[m,n]=size(A);
Z=zeros(m,n);
S=sign(X).*max(abs(X)-A,Z);

end