clc
clear 
close
im=imread('toyobjects.png')
a=double(im)
[r c]=size(a)
w1=[-1 0;0 1]
w2=[0 -1;1 0]
for i=2:r-1
    for j=2:c-1
        a1(i-1,j-1)=sum(a(i-1:i,j-1:j).*w1)
        a2(i-1,j-1)=sum(a(i-1:i,j-1:j).*w2)
    end
end
robert=a1+a2
subplot(1,2,1)
title('Orginal Image');
imshow(im);
subplot(1,2,2)
title('Robert');
imshow(uint8(robert));
