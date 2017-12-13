%%主函数，绘图结果
clc
tic;
% %%
%trainFeature2;
%testFeature2; 
load block_featureLBPSIPtrain1210;
load block_featureLBPSIPtest1210;
train_label=load('train_label.txt');
test_label=load('test_label.txt');

%  
%%  LIBSVM分类
model = svmtrain(train_label,P_train,'-s 0 -t 2 -c 4 -g 0.5');
[predict,accuracy, decision_values]=svmpredict(test_label,P_test,model,'-b 0');
% model = svmtrain(train_label,train,'-s 0 -t 0 -c 1.2 -g 230');%-t 核函数；0线性 1多项式 2 RBF函数 3 sigmoid
t=predict-test_label;
l=length(find(t==0));
z=size(test_label,1);
% Accuracytrain=n1/size(train_label,1)*100   %统计训练精度
disp('ILDN-TOP LIBSVM识别效率如下：');
Accuracytest=l/size(test_label,1)*100     %统计测试精度


toc

