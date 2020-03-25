function [Tout] = lime_loop(img_in,mu0,rho0,flag,itr)
%for tuning the parameters of the solver

%img_in is the raw image
%mu0 and rho0 are seed points for mu and rho
%flag controls which parameter is tuned 
%itr is no. of iterations or changes in the parameter

%Tout contains the illumination maps for all iterations

[m,n,p]=size(img_in);
Tout=zeros(m,n,p,itr);

alpha=0.008; %same for all images
mu=mu0;
rho=rho0;

for i=1:1:itr
    [Tout(:,:,:,i),Ti]=lime(img_in,alpha,mu,rho,0.8); %obtaining illumination maps for set of values
    if flag==1
        mu=mu+0.01; %change updation rule as required
    elseif flag==2
        rho=rho+0.005; %change updation rule as required
    else 
        alpha=alpha*10; %change updation rule as required
    end
    if i<=10
        img_out=im2double(img_in)./Tout(:,:,:,i); %enhanced result
        subplot(2,5,i); imshow(img_out);
    end
end

end