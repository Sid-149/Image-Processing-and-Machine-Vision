clc
clear
im=imread('one.jpg')
a=rgb2gray(im)
[r1 c1]=size(a)
q=double(a)
c=fft2(q)
s=fftshift(c)

figure(1)
subplot(1,3,1)
title('Orignal')
imshow(im)
subplot(1,3,2)
title('FFT')
imshow(uint8(c))
subplot(1,3,3)
title('FFT SHIFT')
imshow(uint8(s))


d0=[10 30 100]
for k=1:length(d0)
for i=1:r1
    for j=1:c1
        C(i,j)=((i-(r1/2))^2+(j-(c1/2))^2)^0.5
        if C(i,j)<=d0(k) then
            H(i,j)=1
        else 
            H(i,j)=0
        end
    end
end
end
aq=s.*H
g=abs(ifft(aq))

figure(2)
subplot(1,2,1)
title('IFFT')
imshow(uint8(aq))
subplot(1,2,2)
title('Filtered Image')
imshow(uint8(g))

