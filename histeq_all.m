function [img_hist_trans, img_hist_sep, img_hist_hsv, img_hist_yuv, img_hist_ycbcr] = histeq_all(img_in, flag)
%histogram equalization for low light image enhancement

%img_in is the raw image
%flag is set to 1 for displaying the outputs

%output vector contains the results of five methods of histogram equalization

img_test=im2double(img_in);

img_hist_trans=histeq(img_test); %same as hist_trans
img_hist_sep=hist_sep(img_test);
img_hist_hsv=histeq_hsv(img_test);
img_hist_yuv=histeq_yuv(img_test);
img_hist_ycbcr=histeq_ycbcr(img_test);

if flag==1
    subplot(2,3,1);imshow(img_test);
    subplot(2,3,2);imshow(img_hist_trans);
    subplot(2,3,3);imshow(img_hist_sep);
    subplot(2,3,4);imshow(img_hist_hsv);
    subplot(2,3,5);imshow(img_hist_yuv);
    subplot(2,3,6);imshow(img_hist_ycbcr);
end

end