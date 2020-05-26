clear all
clc

srcImages=dir('E:\testimages1000\*.jpg');
n_features1=2*27;
ccvFeatureSet=zeros(length(srcImages),n_features1);

for i=1:length(srcImages)

ImageName=strcat('E:\testimages1000\',num2str(i-1),'.jpg');
img=imread(ImageName);
X=getCCV(img);
X=reshape(transpose(X),1,[]);
ccvFeatureSet(i,:)=X;
i
end

clear X;


scales=4; orientations=6;

filterBank=GenerateGaborFilterBank(scales,orientations,45,45);
filterBank=filterBank';
filterBank=reshape(filterBank,1,scales*orientations);

% filter bank made. Now to prepare the texture database for 1000 images.

texture_features=zeros(length(srcImages),scales*orientations*2);

for i=1:length(srcImages)
     ImageName=strcat('E:\testimages1000\',num2str(i-1),'.jpg');
     img=imread(ImageName);
     texture_features(i,:)=GetTextureFeatures(img,filterBank);
end

fname = 'CCVFeatureSet.mat';
fname1 =  'TextureFeatureSet.mat';
fname2 = 'GaborFilterBank.mat';

save(fname, 'color_features');
save(fname1, 'texture_features');
save(fname2, 'filterbank');


% queryImgName=strcat('E:\testimages1000\',num2str(0),'.jpg');
% %Change the address path according to where the images are stored in your
% %PC
% queryImg=imread(queryImgName);
% figure();
% imshow(queryImg);
% title('Query Image');
% 
% queryImgColorFeatures=getCCV(queryImg);    %color CCV features for query image
% queryImgColorFeatures=reshape(transpose(queryImgColorFeatures),1,[]);
% queryImgTextureFeatures=GetTextureFeatures(queryImg,filterBank); %texture features for query image
% 
% d1=pdist2(queryImgColorFeatures,ccvFeatureSet,'cityblock');
% d2=pdist2(queryImgTextureFeatures,texture_features,'cityblock');
% 
% w1=0.2; w2=0.8;
% d=w1*d1+w2*d2;
% 
% [~,id]=sort(d,'ascend');
%  id=id-1;
% 
%  
% for i=1:50
%     test_img_rgb=imread(strcat('E:\testimages1000\',num2str(id(i)),'.jpg'));
%  figure();
%     imshow(test_img_rgb);
% end
