function [img_out] = histeq_hsv(img_in)
%applying histogram equalization on v channel

imghsv=rgb2hsv(img_in); %colorspace conversion

imgeq=histeq(imghsv(:,:,3));

%recomposing
imgnew(:,:,3)=imgeq;
imgnew(:,:,2)=imghsv(:,:,2);
imgnew(:,:,1)=imghsv(:,:,1);

img_out=hsv2rgb(imgnew); %colorspace conversion

end