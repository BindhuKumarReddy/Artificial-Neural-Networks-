%% Name: Bindhu Kumar Reddy Pulyala
% 0029054149
% problem-3
% pca
clc
close all
clear all
load('usps2.mat')
% principal component analysis
y1(y1==-1)=0;
x=[x1 x2];
[coef,score,latent,t2]=princomp(x');
princ_compo=score(:,1:22);
train_d_pc=princ_compo;
for i=1:length(y1)
    train_label(i)=find(y1(:,i)==1);
end
% train_label=train_label-1;

% train_label=find(y1(y1==1));
% k-means clustering
[cluster_no]=kmeans(train_d_pc,10);
% cluster_no=cluster_no-1;
% centroids=rand(2,22);
% for i=1:iterations
%     for j=1:length(y1)
%         dis()=((train_d_pc(j,:)-centroids(1,:))*(train_d_pc(j,:)-centroids(1,:))');
%     end
% end
% cluster_no=cluster_no-1;
combining=[train_label' cluster_no(1:4649)];
b=zeros(10,4649);
predict_out=zeros(10,4649);
for j=1:10
    temp=find(combining(:,1)==j);
    a=mode(combining(temp,2));
    inde=find(combining(:,2)==a);
    a_array(j)=a;
    
    b(j,inde)=1;
   
end
accur=0;
for i=1:4649
    if find(b(:,i)==1)==find(y1(:,i)==1)
        accur=accur+1;
    else
        accur=accur+0;
    end
end
accur=(accur/4649)*100
% predicting y2
y2=zeros(10,4649);
for j=1:4649
    a=a_array(1:10)==cluster_no(j+4649);
    ind=find(a==1);
%     for i=1:10
%         if a_array(i)==cluster_no(j+464;9)
%             b=1;
%         else 
%             b=0;
%         end
%     end


    y2(ind,j)=1;
   
       
   
   
end