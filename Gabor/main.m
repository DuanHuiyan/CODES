%%����������ͼ���
clc
tic;
% %%
% trainFeature2;
% testFeature2; 
load featureGabortrain3;
load featureGabortest3;
train_label=load('train_label.txt');
test_label=load('test_label.txt');

%  
%%  LIBSVM����
model = svmtrain(train_label,P_train3,'-s 0 -t 1 -c 1024 -g 1024');%-t �˺�����0���� 1����ʽ 2 RBF���� 3 sigmoid
[predict,accuracy, decision_values]=svmpredict(test_label,P_test3,model,'-b 0');

t=predict-test_label;
l=length(find(t==0));
z=size(test_label,1);
% Accuracytrain=n1/size(train_label,1)*100   %ͳ��ѵ������
disp('Gabor LIBSVMʶ��Ч�����£�');
Accuracytest=l/size(test_label,1)*100     %ͳ�Ʋ��Ծ���

toc

