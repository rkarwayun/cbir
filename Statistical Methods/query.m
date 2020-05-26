clear all
clc
fname = 'CCVFeatureSet.mat';
fname2 = 'TextureFeatureSet.mat';
fname3 = 'GaborFilterBank.mat';
load(fname2);
load(fname3);
load(fname);

% variables ccvFeatureSet,texture_features,filterBank are loaded.. Use
% ahead
Nr = 10; % use as needed
classes = [1,101,243,320,401,510,641,725,870,955]; % change as  needed

for i = 1:2
    queryImgName = strcat('C:\Users\Del\Desktop\BTP\images\',num2str(classes(i)),'.jpg');
    queryImg = imread(queryImgName);
    figure();
    imshow(queryImg);
    title('Query Image');
    figure(); %for separating query image and subplots
    
    queryImgColorFeatures = getCCV(queryImg);
    queryImgColorFeatures = reshape(transpose(queryImgColorFeatures),1,[]);
    queryImgTextureFeatures = GetTextureFeatures(queryImg,filterBank); %texture features for query image
    d1 = pdist2(queryImgColorFeatures,ccvFeatureSet,'cityblock');
    d2 = pdist2(queryImgTextureFeatures,texture_features,'cityblock'); 
    w1=0.2; w2=0.8;
    d=w1*d1+w2*d2; 
    [~,id]=sort(d,'ascend');
    id=id-1;
    
    for j=1:Nr
        test_img_rgb=imread(strcat('C:\Users\Del\Desktop\BTP\images\',num2str(id(j)),'.jpg'));
        %figure();
        H = subplot(4,5,j);
        imshow(test_img_rgb);
        title(num2str(j));
    end
    fprintf('Hit Enter to Continue...');
    pause;
end