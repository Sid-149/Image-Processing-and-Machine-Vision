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
b=255-a
subplot(3,1,3)
title('Negative')
imshow(b)
