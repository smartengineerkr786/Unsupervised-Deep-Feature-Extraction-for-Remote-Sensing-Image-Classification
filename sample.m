
RGB=imread('11.tif');
figure,
imshow(RGB);
title('input image');
I=rgb2gray(RGB);
figure,
imshow(I);
title('Gray Image');
level = graythresh(I);
BW = im2bw(I,level);
figure,
imshow(BW);
title('Binary Image');
for k=1:3
    for i=1:size(I,1)
        for j=1:size(I,2)
            if BW(i,j)==1
                seg(i,j,k)=RGB(i,j,k);
            end
        end
    end
end
figure,imshow(seg);
title('Segmented Image');
T=0.4;
seg_img=rgb2gray(seg);
testfeature=wthresh(seg_img,'s',T);
test_fea=mean(testfeature);

