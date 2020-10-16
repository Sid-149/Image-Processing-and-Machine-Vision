clc
clear
im=imread('color.jpg')
subplot(3,1,1)
title('Orignal')
imshow(im)
a=rgb2gray(im)
subplot(3,1,2)
title('Grayscale')
imshow(a)
n=im2double(a)
s=log1p(n)
c=(255)/max(max(n))
x=c*s
u=uint8(x)
subplot(3,1,3)
title('Logarithmic Tranform')
imshow(u)
