clc;
clear;
im=imread('color.jpg')
a=rgb2gray(im)
imshow(im)
//imhist(a,10,’’)
t=100
v=75
b=160
w=175
l=v/t
m=(w-v)/(b-t)
n=(255-w)/(255-b)
q=double(a)
[r c]=size(a)
for i=1:r
    for j=1:c
        if q(i,j)>=0 & q(i,j)<t
            S(i,j)=l*q(i,j)
        elseif q(i,j)>=t & q(i,j)<b
            S(i,j)=m*((q(i,j))-t)+v
        else
            S(i,j)=n*((q(i,j))-b)+w
        end
     end
end
p=uint8(S)
imshow(p)
