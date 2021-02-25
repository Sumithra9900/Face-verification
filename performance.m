clc;clear all;
load('LDA_MLBP.mat')
for features=1:20
adult=1;
    for i11=1:2:127
       young=1;
       for j11=2:2:128 
       DIST_LDA(adult,young)=pdist2(Y(i11,1:features), Y(j11,1:features));%,(FEATURE(j1,:),FEATURE(j1+1,:));
       DIST_PCA(adult,young)=pdist2(X(i11,1:features), X(j11,1:features));
         young=young+1;
       end 
       adult=adult+1;
    end 
    %%
    [A1, B1]=sort(DIST_LDA,2,'ascend');%1:colum 2:row
    [A2, B2]=sort(DIST_PCA,2,'ascend');
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
  ACCURACY(features)=ij/sum(sum_mat);  
  clear match;
end