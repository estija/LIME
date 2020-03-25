function [T] = updateT(Ti,mu,G,U)
%updating T

%Ti is previous value of T
%U=Z/mu and G,Z,mu are variables in the optimization problem

%T is updated Ti

X=G-U;
delX=multiplydtrans(X); %multiplying D transpose with X
Tnum=2*Ti+mu*delX;
Tn=fftshift(fft2(Tnum)); %numerator for updating T

[m,n]=size (Ti);
Td=Tdenom(m,n,mu); %denominator for updating T

Tnd=Tn./Td;
T=ifft2(ifftshift(Tnd));
end