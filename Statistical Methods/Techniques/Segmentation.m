function im = Segmentation(img_rgb,count)

% clc
% clear all
% 
% srcImages=dir('\testimages1000\*.jpg');
% 
% 
% i=510
%     ImageName=strcat('\testimages1000\',num2str(i-1),'.jpg');
%     img_rgb=imread(ImageName);
%     %img_rgb = rgb2hsv(img_rgb1);
%     %imshow(img_rgb)
    img_size=size(img_rgb);
        
I_gray=rgb2gray(img_rgb);
cform = makecform('srgb2lab');
lab_he = applycform(img_rgb,cform);
ab = double(lab_he(:,:,2:3));
nrows = size(ab,1);
ncols = size(ab,2);
ab = reshape(ab,nrows*ncols,2);

nColors = 2;
% repeat the clustering 3 times to avoid local minima
[cluster_idx, cluster_center] = kmeans(ab,nColors,'distance','sqEuclidean','Replicates',3,'emptyaction','singleton');
pixel_labels = reshape(cluster_idx,nrows,ncols);
%img = mat2grey(pixel_labels,[]);
%f1=figure();
%imshow(pixel_labels,[]), title('image labeled by cluster index');
%movegui(f1,'northwest');

testPixel=pixel_labels(1,1);

if testPixel==1
    forePixel=2;
elseif testPixel==2
    forePixel=1;
end


forePixels_id=find(pixel_labels==forePixel);
backPixels_id=find(pixel_labels==testPixel);

%trying to remove back pixels id from rgb image

[I,J]=ind2sub(size(pixel_labels),backPixels_id);
 IMG=img_rgb;
% tic
for i=1:length(I)
    IMG(I(i),J(i),1)=0;
    IMG(I(i),J(i),2)=0;
    IMG(I(i),J(i),3)=0;
end
%count
%toc


im = IMG;

% f1=figure(1);
% imshow(img_rgb);
% movegui(f1,'northwest');
% f2=figure(2);
% imshow(IMG);
% movegui(f2,'northeast');
% 
% f3=figure(3);
% imshow(pixel_labels,[])