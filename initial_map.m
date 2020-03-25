function [test_mask] = initial_map(test_norm)
%obtaining initial illumination map

%test_norm is input image

%test_mask is the initial illumination map for test_norm

y=size(test_norm); %size will be MxNx3 for RGB image
a=zeros(y(1),y(2)); %for single-channel illumination map

for i=1:1:y(1)
    for j=1:1:y(2)
        b=[test_norm(i,j,1),test_norm(i,j,2),test_norm(i,j,3)]; %R,G,B values at a location
        if max(b)==0
            a(i,j)=0.000001; %avoid division by 0 
        else
            a(i,j)=max(b);
        end
    end
end
test_mask=a;

end