clc;clear all;
load('Patch_mat.mat')
class=1;images=1;
for i=1:size(patch,1)
for j=1:size(patch,1)
    %% FULL FACE IMAGE
   img1=rgb2gray(patch{i,1}); 
   img2=rgb2gray(patch{j,2}); 

   DIST_Euclidean(i,j)=corr2(img1, img2);%,(FEATURE(j1,:),FEATURE(j1+1,:));

% %    GROUNDTRUTH(images,:)=class;
% %     images=images+1;
end
end
%%
[A1, B1]=sort(DIST_Euclidean',2,'descend');%1:colum 2:row 
  for j=1:length(B1)
   matching=0; % matching(j)=1;
for i=1:length(B1)
  if((B1(i,j)==i))  
   matching = matching+1 ;
  end
end
match(j)=matching;
  clear matching
  end 
  for ij=1:i
  sum_mat(ij)=(match(ij)*ij); 
  end
  Cumulative_Matching_Character=ij/sum(sum_mat)*100 
% % %   clear match;
% % % end
% % % %%
% % % for features=1:25
% % % adult=1;
% % %     for i11=1:2:127
% % %        young=1;
% % %        for j11=2:2:128 
% % %        DIST_Cosine(adult,young)=pdist2(Y(i11,1:features), Y(j11,1:features),'cosine');
% % %        young=young+1;
% % %        end 
% % %        adult=adult+1;
% % %     end 
% % %     %%
% % %     [A2, B2]=sort(DIST_Cosine,2,'ascend');
% % %   for j=1:length(B2)
% % %    matching=0; % matching(j)=1;
% % % for i=1:length(B2)
% % %   if((B2(i,j)==i))  
% % %    matching = matching+1 ;
% % %   end
% % % end
% % % match(j)=matching;
% % %   clear matching
% % %   end  
% % %   for ij=1:i
% % %   sum_mat(ij)=(match(ij)*ij); 
% % %   end
% % %   ACCURACY_Cosine(NO_OF_PATCHS,features)=ij/sum(sum_mat);  %  ACCURACY_Cosine(NO_OF_PATCHS,features)=ij/sum(sum_mat);  
% % %   clear match;
% % % end
% % % %eval(['save',' Similarity_','_NO_OF_PATCHS_',int2str(NO_OF_PATCHS), ' X Y MLBP_FEAT_img ACCURACY_Cosine ACCURACY_Equlidean'])
% % % clearvars -except patch patch1 patch2 patch3 patch4 patch5 patch6 NO_OF_PATCHS ACCURACY_Cosine ACCURACY_Equlidean
% % % end
% % % end