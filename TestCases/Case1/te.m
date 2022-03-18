function out = detectlogo(image,str)
%image = imread('10.jpg');
%image = imsharpen(image);
%image = imsharpen(image);
%image = imsharpen(image);
if str == 'front'
image = imgaussfilt(image);
figure,imshow(image);
gray = rgb2gray(image);
[~,threshold] = edge(gray,'sobel');
fudgefactor = 0.65;
BWs = edge(gray,'sobel',threshold*fudgefactor);
figure,imshow(BWs);

se90 = strel('line',3,90);
se0  = strel('line',3,0);
diala = imdilate(BWs,[se90,se0]);
figure,imshow(diala);

BWfill= imfill(diala,'holes');
figure,imshow(BWfill)
BWnobord = imclearborder(BWfill,4);


se0  = strel('rectangle',[30,8]);
BWnobord = imerode(BWnobord,se0);
BWnobord = imdilate(BWnobord,se0);
figure,imshow(BWnobord)


CC = bwconncomp(BWnobord);
%figure,imshow(CC);
S = regionprops(CC,'Centroid','Area','BoundingBox');
allarea = [S.Area];

m = allarea(1);
j=1;
[hh,ii] =sort([S.Area],'descend')
out =imcrop(image,S(ii(1)).BoundingBox);


figure,imshow(out)
load('logo.mat');
[h v z]=size(out);

width = v/4;
height = (h/2)+8;
y_min =(((h/2)-(height/2)));
x_min = (((v/2)-(width/2)));
out = imsharpen(out);
out = imcrop(out,[x_min,y_min,width,height]);

figure,imshow(out);
out = rgb2gray(out);
B = imbinarize(out);
[l n]=bwlabel(B);
figure,imshow(l);
corners = detectHarrisFeatures(out);
out = uint8( imresize(out,[600,600]) );
[features,valid_point] = extractFeatures(out, corners);
indexPairs1 = matchFeatures(valid_point,valid_point1);
indexPairs2 = matchFeatures(valid_point,valid_point2);
else
%image = imread('1.jpg');
tmp = image;
image = imsharpen(tmp);
image = imgaussfilt(image,2);
figure,imshow(image);
gray = rgb2gray(image);
[~,threshold] = edge(gray,'sobel');
fudgefactor = 0.7;

BWs = edge(gray,'sobel',threshold*fudgefactor);
figure,imshow(BWs);

se90 = strel('line',3,90);
se0  = strel('line',3,0);
diala = imdilate(BWs,[se90,se0]);
[x y]=size(diala);
for i=1:x
   diala(i,1)=1; 
end
for i=1:y
   diala(1,i)=1; 
end
figure,imshow(diala);


BWfill= imfill(diala,'holes');
figure,imshow(BWfill)
BWnobord = imclearborder(BWfill,4);


s0 =[0 0 0 0 0;
     0 1 1 1 0;
     0 0 0 0 0];
 BWnobord = imerode(BWnobord,se0);
 
se0  = strel('diamond',8);
BWnobord = imerode(BWnobord,se0);

se0  = strel('diamond',25);
BWnobord = imdilate(BWnobord,se0);






figure,imshow(BWnobord)


CC = bwconncomp(BWnobord);
%figure,imshow(CC);
S = regionprops(CC,'Centroid','Area','BoundingBox');
allarea = [S.Area];

m = allarea(1);
j=1;
[hh,ii] = sort([S.Area]);
out =imcrop(tmp,S(ii(1)).BoundingBox);


figure,imshow(out)
load('logo.mat');
[h v z]=size(out);

width = v/4;
height = (h/2)+8;
y_min =(((h/2)-(height/2)));
x_min = (((v/2)-(width/2)));
out = imsharpen(out);


figure,imshow(out);
out = rgb2gray(out);
B = imbinarize(out);
[l n]=bwlabel(B);
figure,imshow(l);
corners = detectHarrisFeatures(out);
out = uint8( imresize(out,[600,600]) );
[features,valid_point] = extractFeatures(out, corners);
indexPairs1 = matchFeatures(valid_point,valid_point1);
indexPairs2 = matchFeatures(valid_point,valid_point2);

end
end