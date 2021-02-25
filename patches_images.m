close all;clc;clear all
C=1;D1=1; letters = num2str('A':'U');
PERSON=1;%strcat(letters(1,count))
    dr1=dir('G:\CVIP_work\AGE GAP DATASET COLORBASED');
    for im1=3:length(dr1)
           dr2=dir(strcat('G:\CVIP_work\AGE GAP DATASET COLORBASED\',dr1(im1).name));
           count=1;
           for im2=3:length(dr2)
              File=strcat(['G:\CVIP_work\AGE GAP DATASET COLORBASED\',dr1(im1).name,'\',dr2(im2).name]);            
                        I=imresize(imread(File),[500 500]);                     
                        PATCH1= imcrop(I,[1 1 250 500]);PATCH2= imcrop(I,[250 1 250 500]);
                        PATCH3= imcrop(I,[125 1 250 500]);                         
                        PATCH4= imcrop(I,[1 1 500 250]); PATCH5= imcrop(I,[1 250 500 250]);
                        PATCH6= imcrop(I,[1 125 500 250]);                        
% % %                       subplot(2,4,1),imshow(I);  subplot(2,4,2),imshow(PATCH1);  subplot(2,4,3),imshow(PATCH2); subplot(2,4,4),imshow(PATCH3);     
% % %                       subplot(2,4,5),imshow(I);  subplot(2,4,6),imshow(PATCH4);  subplot(2,4,7),imshow(PATCH5); subplot(2,4,8),imshow(PATCH6);
                      mkdir('G:\CVIP_work\AGE_GAP\PATCH\',int2str(count))
                      imwrite(imresize(PATCH1,[227 227]),['G:\CVIP_work\AGE_GAP\PATCH\',int2str(count),'\',int2str(PERSON),'.jpg']);
                      
                      mkdir('G:\CVIP_work\AGE_GAP\PATCH1\',int2str(count))
                      imwrite(imresize(PATCH1,[227 227]),['G:\CVIP_work\AGE_GAP\PATCH1\',int2str(count),'\',int2str(PERSON),'.jpg']);
                      
                      mkdir('G:\CVIP_work\AGE_GAP\PATCH2\',int2str(count))
                      imwrite(imresize(PATCH2,[227 227]),['G:\CVIP_work\AGE_GAP\PATCH2\',int2str(count),'\',int2str(PERSON),'.jpg']);
                      
                      mkdir('G:\CVIP_work\AGE_GAP\PATCH3\',int2str(count))
                      imwrite(imresize(PATCH3,[227 227]),['G:\CVIP_work\AGE_GAP\PATCH3\',int2str(count),'\',int2str(PERSON),'.jpg']);
                      
                      mkdir('G:\CVIP_work\AGE_GAP\PATCH4\',int2str(count))
                      imwrite(imresize(PATCH4,[227 227]),['G:\CVIP_work\AGE_GAP\PATCH4\',int2str(count),'\',int2str(PERSON),'.jpg']);
                      
                      mkdir('G:\CVIP_work\AGE_GAP\PATCH5\',int2str(count))
                      imwrite(imresize(PATCH5,[227 227]),['G:\CVIP_work\AGE_GAP\PATCH5\',int2str(count),'\',int2str(PERSON),'.jpg']);
                      
                      mkdir('G:\CVIP_work\AGE_GAP\PATCH6\',int2str(count))
                      imwrite(imresize(PATCH6,[227 227]),['G:\CVIP_work\AGE_GAP\PATCH6\',int2str(count),'\',int2str(PERSON),'.jpg']);
                      count=count+1;
           end
           PERSON=PERSON+1;
    end