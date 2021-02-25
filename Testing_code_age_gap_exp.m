clc;clear all;
load('Patch_mat.mat')
for NO_OF_PATCHS=1:1  
class=1;images=1;
for i=1:size(patch,1)
for j=1:size(patch,2)
    if (NO_OF_PATCHS==1)
    %% FULL FACE IMAGE
   img=rgb2gray(patch{i,j});   
                %HOG_FEAT_img(images,:)=extractHOGFeatures(img,'CellSize',[32 32],'BlockSize',[8 8]);
                MLBP_FEAT_img(images,1:59)=extractLBPFeatures(img,'NumNeighbors',8,'Radius',1,'Interpolation','Linear');
                MLBP_FEAT_img(images,60:118)=extractLBPFeatures(img,'NumNeighbors',8,'Radius',2,'Interpolation','Linear');
                MLBP_FEAT_img(images,119:177)=extractLBPFeatures(img,'NumNeighbors',8,'Radius',3,'Interpolation','Linear');
                MLBP_FEAT_img(images,178:236)=extractLBPFeatures(img,'NumNeighbors',8,'Radius',4,'Interpolation','Linear');
%% PATCH1:
  elseif(NO_OF_PATCHS==2)
img1=rgb2gray(patch1{i,j});                
                %HOG_FEAT_img(images,:)=extractHOGFeatures(img1,'CellSize',[16 16],'BlockSize',[8 8]);
                MLBP_FEAT_img(images,1:59)=extractLBPFeatures(img1,'NumNeighbors',8,'Radius',1,'Interpolation','Linear');
                MLBP_FEAT_img(images,60:118)=extractLBPFeatures(img1,'NumNeighbors',8,'Radius',2,'Interpolation','Linear');
                MLBP_FEAT_img(images,119:177)=extractLBPFeatures(img1,'NumNeighbors',8,'Radius',3,'Interpolation','Linear');
                MLBP_FEAT_img(images,178:236)=extractLBPFeatures(img1,'NumNeighbors',8,'Radius',4,'Interpolation','Linear');
%% PATCH2:
  elseif(NO_OF_PATCHS==3)
img2=rgb2gray(patch2{i,j});
             %   HOG_FEAT_img(images,:)=extractHOGFeatures(img2,'CellSize',[16 16],'BlockSize',[8 8]);
                MLBP_FEAT_img(images,1:59)=extractLBPFeatures(img2,'NumNeighbors',8,'Radius',1,'Interpolation','Linear');
                MLBP_FEAT_img(images,60:118)=extractLBPFeatures(img2,'NumNeighbors',8,'Radius',2,'Interpolation','Linear');
                MLBP_FEAT_img(images,119:177)=extractLBPFeatures(img2,'NumNeighbors',8,'Radius',3,'Interpolation','Linear');
                MLBP_FEAT_img(images,178:236)=extractLBPFeatures(img2,'NumNeighbors',8,'Radius',4,'Interpolation','Linear');
%% PATCH3:
  elseif(NO_OF_PATCHS==4) 
img3=rgb2gray(patch3{i,j});  
        %        HOG_FEAT_img(images,:)=extractHOGFeatures(img3,'CellSize',[16 16],'BlockSize',[8 8]);
                MLBP_FEAT_img(images,1:59)=extractLBPFeatures(img3,'NumNeighbors',8,'Radius',1,'Interpolation','Linear');
                MLBP_FEAT_img(images,60:118)=extractLBPFeatures(img3,'NumNeighbors',8,'Radius',2,'Interpolation','Linear');
                MLBP_FEAT_img(images,119:177)=extractLBPFeatures(img3,'NumNeighbors',8,'Radius',3,'Interpolation','Linear');
                MLBP_FEAT_img(images,178:236)=extractLBPFeatures(img3,'NumNeighbors',8,'Radius',4,'Interpolation','Linear');
%% PATCH4:
  elseif(NO_OF_PATCHS==5)  
img4=rgb2gray(patch4{i,j});
              %  HOG_FEAT_img(images,:)=extractHOGFeatures(img4,'CellSize',[16 16],'BlockSize',[8 8]);
                MLBP_FEAT_img(images,1:59)=extractLBPFeatures(img4,'NumNeighbors',8,'Radius',1,'Interpolation','Linear');
                MLBP_FEAT_img(images,60:118)=extractLBPFeatures(img4,'NumNeighbors',8,'Radius',2,'Interpolation','Linear');
                MLBP_FEAT_img(images,119:177)=extractLBPFeatures(img4,'NumNeighbors',8,'Radius',3,'Interpolation','Linear');
                MLBP_FEAT_img(images,178:236)=extractLBPFeatures(img4,'NumNeighbors',8,'Radius',4,'Interpolation','Linear');
%% PATCH5:
  elseif(NO_OF_PATCHS==6)
  img5=rgb2gray(patch5{i,j});
               % HOG_FEAT_img(images,:)=extractHOGFeatures(img5,'CellSize',[16 16],'BlockSize',[8 8]);
                MLBP_FEAT_img(images,1:59)=extractLBPFeatures(img5,'NumNeighbors',8,'Radius',1,'Interpolation','Linear');
                MLBP_FEAT_img(images,60:118)=extractLBPFeatures(img5,'NumNeighbors',8,'Radius',2,'Interpolation','Linear');
                MLBP_FEAT_img(images,119:177)=extractLBPFeatures(img5,'NumNeighbors',8,'Radius',3,'Interpolation','Linear');
                MLBP_FEAT_img(images,178:236)=extractLBPFeatures(img5,'NumNeighbors',8,'Radius',4,'Interpolation','Linear');
 %% PATCH6:
    elseif(NO_OF_PATCHS==7)
    img6=rgb2gray(patch6{i,j});
              %  HOG_FEAT_img(images,:)=extractHOGFeatures(img6,'CellSize',[16 16],'BlockSize',[8 8]);
                MLBP_FEAT_img(images,1:59)=extractLBPFeatures(img6,'NumNeighbors',8,'Radius',1,'Interpolation','Linear');
                MLBP_FEAT_img(images,60:118)=extractLBPFeatures(img6,'NumNeighbors',8,'Radius',2,'Interpolation','Linear');
                MLBP_FEAT_img(images,119:177)=extractLBPFeatures(img6,'NumNeighbors',8,'Radius',3,'Interpolation','Linear');
                MLBP_FEAT_img(images,178:236)=extractLBPFeatures(img6,'NumNeighbors',8,'Radius',4,'Interpolation','Linear');
    end
 GROUNDTRUTH(images,:)=class;
    images=images+1;
end
    class=class+1;
end
Covariance_matrix=cov(double(MLBP_FEAT_img)');
[W, lambda]=eig(Covariance_matrix);
Lambda=diag(lambda);
[Lambda1, sortedorder]=sort(Lambda,'descend');
nonzero_eigen= length(find(Lambda1>0));
Feature_of_nonzero_eigen=W(:,sortedorder(1:nonzero_eigen)); 
split_pca=round(50*nonzero_eigen/100);
Feature_selected_random_eigen=W(:,sortedorder(1:split_pca)); 
L=GROUNDTRUTH;
X=Feature_selected_random_eigen;%MLBP_FEAT_img;%
%
    Classes=unique(L)';
    k=numel(Classes);
    n=zeros(k,1);
    C=cell(k,1);
    M=mean(X);
    S=cell(k,1);
    Sw=0;
    Sb=0;
    for j=1:k
        Xj=X(L==Classes(j),:);
        n(j)=size(Xj,1);
        C{j}=mean(Xj);
        S{j}=0;
        for i=1:n(j)
            S{j}=S{j}+(Xj(i,:)-C{j})'*(Xj(i,:)-C{j});
        end
        Sw=Sw+S{j};
        Sb=Sb+n(j)*(C{j}-M)'*(C{j}-M);
    end
    [W, LAMBDA]=eig(Sb,Sw);
    lambda=diag(LAMBDA);
    [lambda, SortOrder]=sort(lambda,'descend');
    W=W(:,SortOrder);
    Y=(X*W);

    %%
% % % % for features=1:25
% % % % adult=1;
% % % %     for i11=1:2:127
% % % %        young=1;
% % % %        for j11=2:2:128 
% % % %        DIST_Euclidean(adult,young)=pdist2(Y(i11,1:features), Y(j11,1:features));%,(FEATURE(j1,:),FEATURE(j1+1,:));
% % % %        young=young+1;
% % % %        end 
% % % %        adult=adult+1;
% % % %     end 
% % % %     %%
% % % %     [A1, B1]=sort(DIST_Euclidean,2,'ascend');%1:colum 2:row 
% % % %   for j=1:length(B1)
% % % %    matching=0; % matching(j)=1;
% % % % for i=1:length(B1)
% % % %   if((B1(i,j)==i))  
% % % %    matching = matching+1 ;
% % % %   end
% % % % end
% % % % match(j)=matching;
% % % %   clear matching
% % % %   end 
% % % %   for ij=1:i
% % % %   sum_mat(ij)=(match(ij)*ij); 
% % % %   end
% % % %   ACCURACY_Equlidean(NO_OF_PATCHS,features)=ij/sum(sum_mat);  
% % % %   clear match;
% % % % end
%%
for features=1:25
adult=1;
    for i11=1:2:127
       young=1;
       for j11=2:2:128 
       DIST_Cosine(adult,young)=pdist2(Y(i11,1:features),Y(j11,1:features),'cosine');
       young=young+1;
       end 
       adult=adult+1;
    end 
    %%
    [A2, B2]=sort(DIST_Cosine,2,'ascend');
  for j=1:length(B2)
   matching=0; % matching(j)=1;
for i=1:length(B2)
  if((B2(i,j)==i))  
   matching = matching+1 ;
  end
end
match(j)=matching;
  clear matching
  end  
  for ij=1:i
  sum_mat(ij)=(match(ij)*ij); 
  end
  ACCURACY_Cosine(NO_OF_PATCHS,features)=ij/sum(sum_mat);  %  ACCURACY_Cosine(NO_OF_PATCHS,features)=ij/sum(sum_mat);  
  clear match;
end
%eval(['save',' Similarity_','_NO_OF_PATCHS_',int2str(NO_OF_PATCHS), ' X Y MLBP_FEAT_img ACCURACY_Cosine ACCURACY_Equlidean'])
clearvars -except patch patch1 patch2 patch3 patch4 patch5 patch6 NO_OF_PATCHS ACCURACY_Cosine ACCURACY_Equlidean
end
% % eval(['save',' Similarity_MLBP_LDA_Results', ' ACCURACY_Cosine ACCURACY_Equlidean'])