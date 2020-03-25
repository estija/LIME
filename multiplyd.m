function [delT] = multiplyd(T)
%multiplying D with T to get gradient of T

%T is input matrix
%delt is gradient of T

%Dx transpose is of size NxN+1 and Dy is of size MxM+1
%obtaining both using same code
[m,n]=size(T);
Dy=maked_alt(m);
Dxt=maked_alt(n);
Dx=Dxt'; %transposition

%making T as size M+1 times N
altTy=zeros(m+1,n);
altTy(1:m,1:n)=T;
altTy(m+1,1:n-1)=T(1,2:n);
altTy(m+1,n)=T(1,1);

%vertical gradient of T
delTy=Dy*altTy;

%making T as size M times N+1
altTx=zeros(m,n+1);
altTx(1:m,1:n)=T;
altTx(1:m,n+1)=T(1:m,1);

%horizontal gradient of T
delTx=altTx*Dx;

%concatenating to get matrix of size 2MxN
dtx=reshape(delTx,[m*n,1]);
dty=reshape(delTy,[m*n,1]);
dt=[dtx;dty];
delT=reshape(dt,[2*m,n]);

end