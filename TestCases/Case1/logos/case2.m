image1 = imread('Case2-Rear2.jpg');
size(image1)
final = uint8(size(size(image)));

image = imgaussfilt(image1,1);
image = imsharpen(image1);
image = imsharpen(image);
image = imsharpen(image);
image = imsharpen(image);

I=[1 0 0 0 1;
   0 0 0 0 1;
   1 0 0 1 1];
figure,imshow(image); 

gray = rgb2gray(image);
BW = imbinarize(gray);
BW = ~BW;
se = strel('rectangle',[8,3]);
BW = imerode(BW,se);
%se = strel('square',1);
%BW = imerode(BW,se);
se = strel('rectangle',[25,41]);
BW = imdilate(BW,se);
se = strel('square',5);
BW = imdilate(BW,se);
%BW = imdilate(BW,se);
%se = strel('disk',2);
%BW = imerode(BW,se);
%se = strel('disk',6);
%BW = imdilate(BW,se);

%se = strel('square',5);
%BW = imerode(BW,se);

%se = strel('disk',1);
%BW = imdilate(BW,se);
%BW =BW;
%se = strel('square',4);
%BW = imdilate(BW,se);
%se = strel('square',2);
%BW = imerode(BW,se);
[L num] = bwlabel(BW);
L = imfill(L);
figure,imshow(L)
H=false(size(BW));
[h v]=size(H);
for i=1:num
    if i==8
         H(L==8)=true;
    end
end
figure,imshow(H);
x=1;
y=1;
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
%figure,imshow(final,[])

%image1= uint8( imresize(image1,[64,128]) );
figure,imshow(image1);
figure,imshow(final)
%final= uint8( imresize(final,[200,200]) );
%[J,rect] = imcrop(final);
figure,imshow(final,[]);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%crop final output

%newdinal = imcrop(final,[488 444 518 491]);
%figure,imshow(newdinal);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
new_gray=rgb2gray(final);
%logo1= uint8( imresize(logo1,[350,350]) );
regions = detectMSERFeatures(new_gray);

[features, validPoints] =extractFeatures(new_gray,regions,'Upright',true);
logo1=imread('opel-logo.png');
%figure,imhist(logo1)
%logo1= uint8( imresize(logo1,[350,350]) );
%features1 = detectSURFFeatures(logo1);
logo1 = rgb2gray(logo1);
regions1 = detectMSERFeatures(logo1);
[features1, validPoints1] =extractFeatures(logo1,regions1,'Upright',true); 

logo2=imread('hyn.jpg');
logo2 = rgb2gray(logo2);
%logo2= uint8( imresize(logo2,[350,350]));
regions2 = detectMSERFeatures(logo2);
[features2, validPoints2] =extractFeatures(logo2,regions2,'Upright',true);
[indexpair,matchmetric] = matchFeatures(features,features2);
indexpair
matchmetric