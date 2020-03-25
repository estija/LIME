function [output,ini_map] = lime(input_image,alpha,mu,rho,gamma)
%obtaining illumination map

%input_image is raw image
%alpha, mu, rho are constant parameters for the solver
%gamma is parameter for gamma correction

%output is three-channel refined illumination map 
%ini_map is single-channel initial illumination map

B_norm = im2double(input_image);
ini_map = initial_map(B_norm);
%single-channel refined illumination map
[ref_map] = lime_trial(ini_map, alpha, mu, rho); 

abs_ref_map = abs(ref_map);
T_gamma = gamma_corr(abs_ref_map, gamma);

%mapping ref_map to three channels
Topt(:,:,1) = T_gamma;
Topt(:,:,2) = T_gamma;
Topt(:,:,3) = T_gamma;
output = Topt;

end