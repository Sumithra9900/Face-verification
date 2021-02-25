clc;clear all
for NO_OF_PATCHS=1:1%6
%dirct=strcat(['F:\LFW_face_images\YEARLY_DATA_FOR_PATCHES',num2str(patches),'_',num2str(Features(1,FEATURES)),'.mat']);        
FaceDatasetPath = fullfile(strcat('F:\PAPERS\CVIP_work\AGE_GAP\PATCH'));
%FaceDatasetPath = fullfile(strcat('F:\PAPERS\CVIP_work\AGE_GAP\PATCH',num2str(NO_OF_PATCHS)));
imds = imageDatastore(FaceDatasetPath,'IncludeSubfolders',true,'LabelSource','foldernames') ;   
for archt=1:4
    if(archt==1)
net=alexnet;
net.Layers;
inputSize = net.Layers(1).InputSize;%[227 227];
image=augmentedImageDatastore(inputSize,imds);
layer = 'fc6';%'fc6,fc1000,loss3-classifier
FEATUREMATRIX = activations(net,image,layer,'OutputAs','rows');

    elseif(archt==2)
net=vgg19;
net.Layers;
inputSize = net.Layers(1).InputSize;%[227 227];
image=augmentedImageDatastore(inputSize,imds);
layer = 'fc6';%'fc6,fc1000,loss3-classifier
FEATUREMATRIX = activations(net,image,layer,'OutputAs','rows');

    elseif(archt==3)
net=resnet101;
net.Layers;
inputSize = net.Layers(1).InputSize;%[227 227];
image=augmentedImageDatastore(inputSize,imds);
layer = 'fc1000';%'fc6,fc1000,loss3-classifier
FEATUREMATRIX = activations(net,image,layer,'OutputAs','rows');

    elseif(archt==4)
net=googlenet;
net.Layers;
inputSize = net.Layers(1).InputSize;%[227 227];
image=augmentedImageDatastore(inputSize,imds);
layer = 'loss3-classifier';%'fc6,fc1000,loss3-classifier
FEATUREMATRIX = activations(net,image,layer,'OutputAs','rows');
    end
% % Covariance_matrix=cov(double(FEATUREMATRIX'));
% % [W, lambda]=eig(Covariance_matrix);
% % Lambda=diag(lambda);
% % [Lambda1, sortedorder]=sort(Lambda,'descend');
% % nonzero_eigen= length(find(Lambda1>0));
% % Feature_of_nonzero_eigen=W(:,sortedorder(1:nonzero_eigen)); 
% % split_pca=round(50*nonzero_eigen/100);
% % Feature_selected_random_eigen=W(:,sortedorder(1:split_pca)); 
 L=imds.Labels;
 X=FEATUREMATRIX;
% % Y=Feature_selected_random_eigen;
%%
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
    Y=abs(X*W);
    %%
for features=1:20
adult=1;
    for i11=1:2:127
       young=1;
       for j11=2:2:128 
       DIST_Euclidean(adult,young)=pdist2(Y(i11,1:features), Y(j11,1:features));%,(FEATURE(j1,:),FEATURE(j1+1,:));
       young=young+1;
       end 
       adult=adult+1;
    end 
    %%
    [A1, B1]=sort(DIST_Euclidean,2,'ascend');%1:colum 2:row 
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
  ACCURACY_Equlidean(archt,features)=ij/sum(sum_mat);  
  clear match;
end
%%
for features=1:20
adult=1;
    for i11=1:2:127
       young=1;
       for j11=2:2:128 
       DIST_Cosine(adult,young)=pdist2(Y(i11,1:features), Y(j11,1:features),'cosine');
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
  ACCURACY_Cosine(archt,features)=ij/sum(sum_mat);  
  clear match;
end
end
%eval(['save',' Deep_Similarity_LDA_TRNS','_NO_OF_PATCHS_',int2str(NO_OF_PATCHS), ' ACCURACY_Cosine ACCURACY_Equlidean'])
clearvars -except patch patch1 patch2 patch3 patch4 patch5 patch6 NO_OF_PATCHS ACCURACY_Cosine ACCURACY_Equlidean
end
eval(['save',' DEEP_Similarity_LDA_TRNS', ' ACCURACY_Cosine ACCURACY_Equlidean'])