clc
clear
im=imread('color.jpg')
a=rgb2gray(im)
[r1 c1]=size(a)
if r1>c1 then
    c1=r1
    Fr2=imresize(a,[r1 r1])
elseif c1>r1
    r1=c1
    Fr2=imresize(a,[c1 c1])
else
    Fr2=imresize(a,[r1 c1])
end
n=im2double(Fr2)
b=r1
for i=0:b-1
    for j=0:b-1
        if i==0
            alpha=sqrt(1/b)
        else
            alpha=sqrt(2/b)
end
z=((2*j)+1)
u=i*%pi
c(i+1,j+1)=alpha*(cos((z*u)/2*b))
end
end
t=c*n*c'
subplot(2,1,1)
title('DCT')
imshow(t)
q=c'*t*c
subplot(2,1,2)
title('IDCT')
imshow(uint8(q))
