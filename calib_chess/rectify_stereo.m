rgbLPath = "./rgb_left/RGB_LEFT_0.jpg";
rgbRPath = "./rgb_right/RGB_RIGHT_0.jpg";

rgbL = imread(rgbLPath);
rgbR = imread(rgbRPath);



%imshowpair(rgbL, rgbR, 'montage')


[rgbL_rec1, rgbR_rec1] = rectifyStereoImages(rgbL(:,:,1), rgbR(:,:,1), stereoParams3);
[rgbL_rec2, rgbR_rec2] = rectifyStereoImages(rgbL(:,:,2), rgbR(:,:,2), stereoParams3);
[rgbL_rec3, rgbR_rec3] = rectifyStereoImages(rgbL(:,:,3), rgbR(:,:,3), stereoParams3);

rgbL_rec = cat(3, rgbL_rec1, rgbL_rec2, rgbL_rec3);
rgbR_rec = cat(3, rgbR_rec1, rgbR_rec2, rgbR_rec3);

rgbL_rec_gray = rgb2gray(rgbL_rec);
rgbR_rec_gray = rgb2gray(rgbR_rec);

imshowpair(rgbL_rec, rgbR_rec, 'montage')

%figure; 
%imshow(stereoAnaglyph(rgbL_rec,rgbR_rec));

%disparityRange = [0 96];
%disparityMap = disparitySGM(rgbL_rec_gray,rgbR_rec_gray,'DisparityRange',disparityRange,'UniquenessThreshold',20);

%figure
%imshow(disparityMap,disparityRange)
%title('Disparity Map')
%colormap jet
%colorbar