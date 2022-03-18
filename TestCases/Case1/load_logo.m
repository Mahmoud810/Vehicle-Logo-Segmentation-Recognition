hy = imread('hyn.png');
hy1 = imread('hyn1.png');
op = imread('opel.png');
kia = imread('kia.png');
 
hy1 = imsharpen(hy1);
hy1 = imsharpen(hy1);
hy1 = imsharpen(hy1);

hy = imsharpen(hy);


%kia = imsharpen(kia);
%kia = imsharpen(kia);

hy=rgb2gray(hy);
hy1=rgb2gray(hy1);
op=rgb2gray(op);
kia=rgb2gray(kia);


 se0  = strel('line',3,0);
 se1  = strel('line',3,90);
 kia = imdilate(kia,[se0,se1]);  

   
figure,imshow(hy1);
hy = imbinarize(hy);
hy1 = imbinarize(hy1);
op = imbinarize(op);
kia = imbinarize(kia);


figure,imshow(hy1);
hy = uint8( imresize(hy,[600,600]) );
hy1 = uint8( imresize(hy1,[600,600]) );
op = uint8( imresize(op,[600,600]) );
kia = uint8( imresize(kia,[600,600]) );
corners1 = detectMinEigenFeatures(hy);
strongest1 = selectStrongest(corners1,259);
figure, plot(corners1);
features_hy =extractFeatures(hy,strongest1);

corners4 = detectMinEigenFeatures(hy1);
strongest4 = selectStrongest(corners4,270);
figure, plot(corners4);
features_hy4 =extractFeatures(hy1,strongest4);

corners2 = detectMinEigenFeatures(op);
strongest2 = selectStrongest(corners2,259);
features_op = extractFeatures(op,strongest2);
figure, plot(corners2);

corners3 = detectMinEigenFeatures(kia);
strongest3 = selectStrongest(corners3,259);
figure, plot(corners3);
features_kia =extractFeatures(kia,strongest3);
