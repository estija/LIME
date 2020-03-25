function [Td] = Tdenom(m,n,mu)
%gives denominator of updation equation for T sub problem

%[m,n] is the size of extended dx and dy
%mu is a parameter for the solver

%Td is the required denominator

dxe = zeros(m,n); %extended dx
dye = zeros(m,n); %extended dy
%acc. to horizontal and vertical gradient convolution kernels dx and dy
dxe(2,2) = -1;
dxe(2,3) = 1;
dye(2,2) = -1;
dye(3,2) = 1;

dxf=fftshift(fft2(dxe));
dxc=dxf.''; %conjugate
dx_mod=dxc.*dxf;

dyf=fftshift(fft2(dye));
dyc=dyf.'';
dy_mod=dyc.*dyf;

Td=2+mu*(dx_mod+dy_mod);

end