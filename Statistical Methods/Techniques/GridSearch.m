function weight_results1 = GridSearch( color_features,texture_features,filterBank )
a = [0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0];
b = [1.0, 0.9, 0.8, 0.7, 0.6, 0.5, 0.4, 0.3, 0.2 ,0.1, 0];
weight_results1 = zeros(10,10); %Nr=10 (count_Correct)
weight_results2 = zeros(10,10); % Nr= 20 (count_correct)
% 10weight combinations and 8x3 result for each combination
for weight_id = 1:10
    w1 = a(weight_id);
    w2 = b(weight_id);
  
    Nr1 = 15;
    Nr2 = 20;
    classes = [1,101,243,320,401,510,641,725,870,955];
    for index = 1:10
        count_correct1 = 0;
        count_correct2 = 0;
        query_num = classes(index);
        queryImgName=strcat('E:\testimages1000\',num2str(query_num),'.jpg');
        queryImg=imread(queryImgName);
        
        queryImgColorFeatures=getCCV(queryImg);    %color CCV features for query image
        queryImgColorFeatures=reshape(transpose(queryImgColorFeatures),1,[]);
        queryImgTextureFeatures=GetTextureFeatures(queryImg,filterBank); %texture features for query image

        d1=pdist2(color_features,queryImgColorFeatures,'cityblock'); %default is euclidean
        d2=pdist2(texture_features,queryImgTextureFeatures,'cityblock');
        d=w1*d1+w2*d2;

        [~,id]=sort(d,'ascend');
         id=id-1;
        
        for i=1:Nr1
            result_num=id(i);
            if (CheckClassbyLabels(query_num, result_num) == 1 ) % same class
                    count_correct1 = count_correct1 + 1;
            end
        end
        
        for i=1:Nr2
            result_num=id(i);
            if (CheckClassbyLabels(query_num, result_num) == 1 ) % same class
                    count_correct2 = count_correct2 + 1;
            end
        end
        
        weight_results1(weight_id,index) = count_correct1;
        weight_results2(weight_id,index) = count_correct2;
        
        
    end
    
    
end
csvwrite('Accuracy_Nr_15.csv',weight_results1);
csvwrite('Accuracy_Nr_20.csv',weight_results2);

end

