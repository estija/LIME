function YUV=yuv2rgb(RGB)
%colorspace conversion from YUV to RGB acc. to BT.601

R = RGB(:,:,1);
G = RGB(:,:,2);
B = RGB(:,:,3);

%Conversion Formula
Y = 1*R + 0*G + 1.13983*B;
U = 1*R - 0.39465*G - 0.58060*B;
V = 1*R + 2.03211*G + 0*B;

YUV=cat(3,Y,U,V);

end