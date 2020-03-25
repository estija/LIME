function [out] = gamma_corr(a,gamma)
%applying gamma correction

%a is input image
%gamma is the parameter for gamma correction

%out is the resultant image

out=a.^gamma;

end