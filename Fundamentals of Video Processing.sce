clc
clear all

I=aviopen('clouds.mp4');
vidFrames=avireadframe(I,[2 10])
[row clm col frm]=size(vidFrames)

for k=1:9
    vidFrames1(:,:,k)=rgb2gray(vidFrames(:,:,:,k));
end

I1=double(vidFrames1(:,:,2));
I2=double(vidFrames1(:,:,4));

figure(1)
subplot(1,2,1)
imshow(uint8(I1))
subplot(1,2,2)
imshow(uint8(I2))
title('The two frames under inspection');

[r c]=size(I1)
count=1
for i=1:20:r-20
    for j=1:20:c-20
        bl1=I1(i:i+19,j:j+19)
        bl2=I2(i:i+19,j:j+19)
        D=cov2(bl1,bl2)
        Df=fft2(D)
        phase=Df/(abs(Df));
        iphase=ifft2(phase)
        phasecorel=abs(iphase)
        maxphase(count)=max(max(phasecorel))
        count=count+1
    end
end

M=max(maxphase)
for i=1:length(maxphase)
    maxphase(i)=maxphase(i)/M
end
M=max(maxphase)

figure(2)
plot(maxphase)
title('Plot of phase correlation Vs. block number')
grid on

for im=1:length(maxphase)
    if maxphase(im)==M
        jm=im;break;
    end
end
k=1
for i=1:20:r-20
    for j=1:20:c-20
        bl1(:,:,k)=I1(i:i+19,j:j+19)
        bl2(:,:,k)=I2(i:i+19,j:j+19)
        k=k+1
    end
end
B1=bl1(:,:,jm)
B2=bl2(:,:,jm)

figure(3)
subplot(1,2,1)
imshow(uint8(B1))
subplot(1,2,2)
imshow(uint8(B2))
title('Two blocks with maximum phase correlation');



