close all;clc;clear all
count2=1;
    dr1=dir('F:\PAPERS\CVIP_work\AGE GAP DATASET COLORBASED');
    for im1=3:length(dr1)
           dr2=dir(strcat('F:\PAPERS\CVIP_work\AGE GAP DATASET COLORBASED\',dr1(im1).name));
           count1=1;
           for im2=3:length(dr2)
              File=strcat(['F:\PAPERS\CVIP_work\AGE GAP DATASET COLORBASED\',dr1(im1).name,'\',dr2(im2).name]);            
                   I=imresize(imread(File),[500 500]);                     
                   PATCH1= imcrop(I,[1 1 250 500]);PATCH2= imcrop(I,[250 1 250 500]);PATCH3= imcrop(I,[125 1 250 500]);                         
                   PATCH4= imcrop(I,[1 1 500 250]); PATCH5= imcrop(I,[1 250 500 250]);PATCH6= imcrop(I,[1 125 500 250]);                        
                   patch{count1,count2}=I;
                   patch1{count1,count2}=PATCH1;
                   patch2{count1,count2}=PATCH2;
                   patch3{count1,count2}=PATCH3;
                   patch4{count1,count2}=PATCH4;
                   patch5{count1,count2}=PATCH5;
                   patch6{count1,count2}=PATCH6;             
                   count1=count1+1;
           end
           count2=count2+1;
    end
save Patch_mat.mat patch patch1 patch2 patch3 patch4 patch5 patch6