function [D] = maked_alt(m)
%creating the matrix D for calculating gradient using matrix multiplication

%m is size to get D of size m times m+1
%D is the required output

A=zeros(m,m+1);
for i=1:1:m
     A(i,i)= -1;
     A(i,i+1)= 1;
end
D=A;

end