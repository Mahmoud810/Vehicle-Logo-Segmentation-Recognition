function out = detectlogo(image,str)
%image = imread('10.jpg');
%image = imsharpen(image);
%image = imsharpen(image);
%image = imsharpen(image);
if str == 'f'
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

    width = (v/4)+2;
    height = (h/2)+12;
    y_min =(((h/2)-(height/2)));
    x_min = (((v/2)-(width/2)));
    out = imsharpen(out);
    
    out = imcrop(out,[x_min,y_min,width,height]);
    out = imsharpen(out);
    yyy=out;
    figure,imshow(out);
    out = rgb2gray(out);
    
    B = imbinarize(out);
    [l n]=bwlabel(B);
    figure,imshow(l);
    se135 = strel('line',4,135);
    se90 = strel('line',4,90);
    se45  = strel('line',4,45);
    se0  = strel('line',4,0);
    out = imdilate(B,[se135,se90]);
    out = uint8( imresize(out,[600,600]) );
    figure,imshow(out)
    corners = detectMinEigenFeatures(out);
    strongest = selectStrongest(corners,259);
    
    features = extractFeatures(out,strongest);
    indexPairs1 = matchFeatures(features,features_hy)
    indexPairs2 = matchFeatures(features,features_op)
    indexPairs3 = matchFeatures(features,features_kia)
    tmp_fea = features.Features;
    [x y] = size(features_kia.Features);
    [i j] =size(features.Features);
    row = zeros(1,j);
    for tm=i+1:x
      tmp_fea=[tmp_fea;row]; 
    end
   
    
    figure, plot(strongest);
    figure, plot(strongest1);
    figure, plot(strongest2);
    figure, plot(strongest3);
    [hy a] = size(indexPairs1);
    [op a] = size(indexPairs2);
    [kia a] = size(indexPairs3);
    t=hy;
    label = "hyndia";
    if op>t 
        t=op;
        label="opel";
    elseif kia>t
        label="kia";
    end 
    hold
    figure
    imshow(yyy)
    title(label);
    
    %r1 = corr2(tmp_fea,features_hy.Features)
    %r2 = corr2(tmp_fea,features_op.Features)
    %r3 = corr2(tmp_fea,features_kia.Features)
     
    end
    if str== 'r'
    %image = imread('1.jpg');
    tmp = image;
    %image = imsharpen(tmp);
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

    width = v/5;
    height = (h/2)+4;
    y_min =(((h/2)-(height/2)));
    x_min = (((v/2)-(width/2)));
    out = imsharpen(out);
    

    out = imsharpen(out);
    figure,imshow(out);
    yyy=out;
    out = rgb2gray(out);
    
    B = imbinarize(out);
    figure,imshow(B);
    [l n]=bwlabel(B);
    figure,imshow(l);
    
    se135 = strel('line',4,135);
    se90 = strel('line',4,90);
    se45  = strel('line',4,45);
    se0  = strel('line',4,0);
    out = imdilate(B,[se135,se45]);
    out = uint8( imresize(out,[600,600]) );
    figure,imshow(out)
    corners = detectMinEigenFeatures(out);
    strongest = selectStrongest(corners,259);
    
    features = extractFeatures(out,strongest);
    tmp_fea = features.Features;
    [x y] = size(features_kia.Features);
    [i j] =size(features.Features);
    row = zeros(1,j);
    for tm=i+1:x
      tmp_fea=[tmp_fea;row]; 
    end
   
    figure, plot(strongest);
    figure, plot(strongest1);
    figure, plot(strongest2);
    figure, plot(strongest3);
    
    indexPairs1 = matchFeatures(features,features_hy)
    indexPairs2 = matchFeatures(features,features_op)
    indexPairs3 = matchFeatures(features,features_kia)
    indexPairs4 = matchFeatures(features,features_hy4)
    
    
    r1 = corr2(tmp_fea,features_hy.Features)
    r2 = corr2(tmp_fea,features_op.Features)
    r3 = corr2(tmp_fea,features_kia.Features)
    r4 = corr2(tmp_fea,features_hy4.Features)
    
  
    t=r1;
    label = "hyndia";
    if r2>t 
        t=r2;
        label="opel";
    end
    if r3>t
        t=r3;
        label="kia";
    end
    if r4>t
        label="hyndia";
    end 
    hold
    figure
    imshow(yyy)
    title(label);
    end

end