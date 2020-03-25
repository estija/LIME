function [img_out] = hist_sep(img_in)
%applying histogram equalization on R,G,B channels separately

%recomposing
img_out(:,:,1)=histeq(img_in(:,:,1));
img_out(:,:,2)=histeq(img_in(:,:,2));
img_out(:,:,3)=histeq(img_in(:,:,3));

end

