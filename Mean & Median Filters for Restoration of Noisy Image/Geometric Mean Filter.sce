clc
clear 
close
im=imread('bitcoin.jpg')
an=imnoise(im,'gaussian',0,0.01)
a=double(an)
[r c]=size(a)
for i=2:1:r-1
    for j=2:1:c-1
        b(i,j)=(a(i-1,j-1)*a(i-1,j)*a(i-1,j+1)*a(i,j-1)*a(i,j)*a(i,j+1)*a(i+1,j-1)*a(i+1,j)*a(i+1,j+1))^(1/9);
    end
end
subplot(1,3,1)
title('Orginal Image');
imshow(im);
subplot(1,3,2)
title('Noise Image');
imshow(uint8(an));
subplot(1,3,3)
title('Output Image');
imshow(uint8(b));
