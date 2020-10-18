clc
clear 
close
im=imread('toyobjects.png')
a=double(im)
[r c]=size(a)
w1=[-1 -2 -1;0 0 0;1 2 1]
w2=[-1 0 1;-2 0 2;-1 0 1]
for i=2:r-1
    for j=2:c-1
        a1(i,j)=sum(a(i-1:i+1,j-1:j+1).*w1)
        a2(i,j)=sum(a(i-1:i+1,j-1:j+1).*w2)
    end
end
sobel=a1+a2
subplot(1,2,1)
title('Orginal Image');
imshow(im);
subplot(1,2,2)
title('Sobel');
imshow(uint8(sobel));
