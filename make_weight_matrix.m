function [W] = make_weight_matrix(Ti,ker_size)
%making the weight matrix using second strategy

%Ti is the initial illumination map
%ker_size is the size of the Gaussian kernel

%W is the required weight matrix

[m,n]=size(Ti);
p=m*n;

%obtaining gradient of Ti
delTi=multiplyd(Ti);
dtvec=reshape(delTi,[2*p,1]);

%separating parts used for W_x and W_y
dtx=dtvec(1:p);
dty=dtvec(p+1:2*p);

%obtaining W_x and W_y
w_gauss = fspecial ('gaussian', [ker_size,1], 2);
convl_x = conv(dtx, w_gauss, 'same');
convl_y = conv(dty, w_gauss, 'same');
W_x = 1./(abs(convl_x)+0.0001);
W_y = 1./(abs(convl_y)+0.0001);

%concatenating W_x and W_y to get W
W_vec = vertcat(W_x, W_y);
W = reshape (W_vec, [2*m,n]);

end
