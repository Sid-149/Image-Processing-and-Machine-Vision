im=[0 0 1 1 2 1;1 2 1 1 2 0;1 1 0 0 2 2;1 0 2 0 2 2;2 1 1 1 2 0];

[r c]=size(im);
min_im=min(min(im));
max_im=max(max(im));
out=zeros(max_im-min_im+1);

P_x=0;
P_y=1;

dist=1;
P_x=P_x*dist;
P_y=P_y*dist;
Ci=0;
Cj=0;

for i=min_im:max_im
    Ci=Ci+1;
    Cj=0;
    [x1 y1]=find(im==i);
    x1=x1+P_x;
    y1=y1+P_y;
    for j=min_im:max_im
        Cj=Cj+1;
        [x2 y2]=find(im==j);
        count=0;
        for m=1:length(x1)
            for n=1:length(x2)
                if((x1(m)==x2(n))&&(y1(m)==y2(n)))
                    count=count+1;
                end
            end
        end
        out(Ci,Cj)=count;
    end
end
disp(out)

out=out/sum(out(:));
disp(out)
subplot(1,2,1)
title('Orginal Image');
imshow(im);
subplot(1,2,2)
title('Co-occurence Matrix Image');
imshow(out);

