function [img_out] = denoise_bm3d(img_in,Topt,noise_std)
%for denoising using BM3D 

%img_in is the enhanced image
%Topt is the refined illumination map
%noise_std is the standard deviation of noise corresponding to image values in range [0,255]
addpath('../');
img_yuv=rgb2yuv(img_in); %colorspace conversion

[psnr,img_bm3d_y]=BM3D(1,img_yuv(:,:,1),noise_std,'np',1);

%recomposing
img_yuv_new(:,:,1)=img_bm3d_y;
img_yuv_new(:,:,2)=img_yuv(:,:,2);
img_yuv_new(:,:,3)=img_yuv(:,:,3);

img_bm3d_rgb=yuv2rgb(img_yuv_new); %colorspace conversion, denoised result

img_out=img_in.*Topt+img_bm3d_rgb.*(1-Topt); %recomposed result

end