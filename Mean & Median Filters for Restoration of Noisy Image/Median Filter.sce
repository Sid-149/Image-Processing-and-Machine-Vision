clc
clear 
close
im=imread('bitcoin.jpg')
an=imnoise(im,'salt & pepper',0.05)
a=double(an)
[r c]=size(a)
for i=2:r-1
    for j=2:c-1
        x=a(i-1:i+1,j-1:j+1)
        ta=gsort(x)
        b(i+1,j+1)=ta(5);
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

