%%����������ͼ���
clc
tic;
% %%
% trainFeature2;
% testFeature2; 
load featureLBPtrain;
load featureLBPtest;
train_label=load('train_label.txt');
test_label=load('test_label.txt');


%  
%%  LIBSVM����
model = svmtrain(train_label,P_train,'-s 0 -t 2 -c 16 -g 0.125');
[predict,accuracy, decision_values]=svmpredict(test_label,P_test,model,'-b 0');
% model = svmtrain(train_label,train,'-s 0 -t 0 -c 1.2 -g 230');%-t �˺�����0���� 1����ʽ 2 RBF���� 3 sigmoid
t=predict-test_label;
l=length(find(t==0));
z=size(test_label,1);
% Accuracytrain=n1/size(train_label,1)*100   %ͳ��ѵ������
disp('LBP-TOP LIBSVMʶ��Ч�����£�');
Accuracytest=l/size(test_label,1)*100     %ͳ�Ʋ��Ծ���



toc

