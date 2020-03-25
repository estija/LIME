function [Topt] = lime_trial(Ti,alpha,mu0,rho)
%solver for the optimization problem

%Ti is initial illumination map
%alpha, mu0, rho are constant parameters for the solver

%Topt is refined illumination map

[m,n]=size(Ti);
k0=50; %no. of iterations
Z=zeros(2*m,n); G=Z; k=0; mu=mu0; %initialization
%W=Z+1; %weight matrix using first strategy
W=make_weight_matrix(Ti,5); %weight matrix using second strategy

while k<k0
    U=Z/mu; A=alpha*W/mu; 
    T=updateT(Ti,mu,G,U); %acc. to T sub-problem
    delT=multiplyd(T); %gradient of T
    G=shrinkage(A,(delT+U)); %acc. to G sub-problem
    B=delT-G;
    Z=mu*(B+U); %Z and mu sub-problem
    mu=mu*rho;
    k=k+1;
end
Topt=T;

end