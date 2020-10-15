clc
clear
im=imread('bw1.jpg')
a=im2double(im)
[r c]=size(a)
padded=zeros(r+2,c+2)
a=padded(2:r+1,2:c+1)
a=padded
w=[1 1 1;1 1 1;1 1 1]
aa=find(w==1)
count=length(aa)
[r c]=size(a)
for i=2:r-1
    for j=2:c-1
        sum1=0
        x=a(i-1:i+1,j-1:j+1)
        sum1=sum(x.*w)
    if sum1==count then
        E(i,j)=1
        D(i,j)=1
    elseif sum1>1
        E(i,j)=0
        D(i,j)=1
    else
        E(i,j)=0
        D(i,j)=0
    end
end
end

[r1 c1]=size(D)
padded_D= zeros(r1+2,c1+2);
padded_D(2:r1+1,2:c1+1)=D;

[r1 c1]=size(E)
padded_E= zeros(r1+2,c1+2);
padded_E(2:r1+1,2:c1+1)=E;


for i=2:r-1
    for j=2:c-1
        sum1=0;
        x=padded_E(i-1:i+1,j-1:j+1);
        sum1=sum(x.*w);
        
        if sum1>=1 
            O(i,j)=1;
        else
           
            O(i,j)=0;
            
        end
   end
end
for i=2:r-1
    for j=2:c-1
        sum1=0;
        x=padded_D(i-1:i+1,j-1:j+1);
        sum1=sum(x.*w);
        
        if sum1==count 
            C(i,j)=1;
        else
           
            C(i,j)=0;
            
        end
   end
end


figure(1)
subplot(3,1,1)
title('Original Image')
imshow(im)
subplot(3,1,2)
title('Eroded Image')
imshow(uint8(255*E))
subplot(3,1,3)
title('Dilated Image')
imshow(uint8(255*D))

figure(2)
subplot(3,1,1)
title('Original Image')
imshow(im)
subplot(3,1,2)
title('Opening')
imshow(uint8(255*O))
subplot(3,1,3)
title('Closing')
imshow(uint8(255*C))
