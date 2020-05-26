function  texturevector  = GetTextureFeatures(img,gaborBank)
%
texturevector=[];
N=size(img,1)*size(img,2);
img=rgb2gray(img);
img=im2double(img);

gaborResult=cell(1,length(gaborBank));

for i=1:length(gaborBank)
    gaborResult{i}=imfilter(img,gaborBank{i});
end

for i=1:length(gaborBank)
    gaborAbs=abs(gaborResult{i});
    
    gaborMean=mean(mean(gaborAbs));
    gaborStd=sqrt((sum(sum((gaborAbs-gaborMean).^2)))/N);
    
    texturevector=[texturevector gaborMean gaborStd];
end

end