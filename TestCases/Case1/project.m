image1 = imread('Case1-Front1.bmp');
size(image1)
final = uint8(size(size(image)));

%image = imgaussfilt(image,2);
image = imsharpen(image1);


figure,imshow(image); 

gray = rgb2gray(image);
BW = imbinarize(gray);
rp = regionprops(BW ,'Area');
rp
se = strel('disk',1);
BW = imdilate(BW,se);

se = strel('square',1);
BW = imdilate(BW,se);
se = strel('square',1);
BW = imerode(BW,se);

[L num] = bwlabel(BW);

figure,imshow(L)
H=false(size(BW));
[h v]=size(H);
for i=1:num
    if i==21
         H(L==21)=true;
    end
end
figure,imshow(H);
image(1,1,:)
for i=1:h
  for j=1:v
     if H(i,j)==true
         final(i,j,1)=image1(i,j,1);
         final(i,j,2)=image1(i,j,2);
         final(i,j,3)=image1(i,j,3);
     else 
         final(i,j,1)=0;
         final(i,j,2)=0;
         final(i,j,3)=0; 
     end
  end
end
figure,imshow(image,[])

image1= uint8( imresize(image1,[64,128]) );
figure,imshow(image1);
figure,imhist(final)
final= uint8( imresize(final,[64,128]) );

figure,imshow(final,[])
features = extractHOGFeatures(final)
logo1=imread('opel.png');
figure,imhist(logo1)
logo1= uint8( imresize(logo1,[64,128]) );
features1 = extractHOGFeatures(logo1);
err1 = immse(features,features1)
err1
logo2=imread('hyn.jpg');
logo2 = rgb2gray(logo2);
logo2= uint8( imresize(logo2,[64,128]) );
features2 = extractHOGFeatures(logo2);
err2 = immse(features,features2);
err2
c = corr2(features,features2)
c = xcorr2(features,features1);