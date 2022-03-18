I = imread('DSC_0512.JPG'); 
BW = im2bw(I,0.4); 
se = strel('rectangle', [2 20]); 
BW_opened = imclose(BW,se); 
figure, imshow(BW_opened,[]) 
s=regionprops(BW_opened,'Area','BoundingBox'); 
[hh,ii] = sort([s.Area],'descend'); 
out = imcrop(I,s(ii(2)).BoundingBox); 
figure,imshow(out);