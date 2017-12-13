%%主函数，绘图结果
clc
tic;
% %%
%trainFeature2;
%testFeature2; 
load featureILDNtrainPHOG33;
load featureILDNtestPHOG33;
train_label=load('train_label.txt');
test_label=load('test_label.txt');


%% SVM-KM分类
addpath SVM-KM  %%添加支持向量机工具箱
c = 800;
lambda = 1e-3;
kerneloption= 0.013;   %设置核参数
kernel='poly'; %设置支持向量机的核函数
verbose = 0;
nbclass=4;
[xsup,w,b,nbsv]=svmmulticlassoneagainstall(P_train3,train_label,nbclass,c,lambda,kernel,kerneloption,verbose); %使用支持向量机进行训练获得支持向量
[ypred1,maxi] = svmmultival(P_train3,xsup,w,b,nbsv,kernel,kerneloption);  %训练集测试
[ypred2,maxi] = svmmultival(P_test3,xsup,w,b,nbsv,kernel,kerneloption);   %测试集测试
CC1=ypred1-train_label;
n1=length(find(CC1==0));
Z =length(train_label);
CC2=ypred2-test_label;
n2=length(find(CC2==0));
z=size(test_label,1);
Accuracytrain=n1/size(train_label,1)*100 ;  %统计训练精度
Accuracytest=n2/size(test_label,1)*100 ;    %统计测试精度
disp('LBP-TOP SVM-KM识别效率如下：');
disp(['训练集正确率Accuracy = ' num2str(Accuracytrain) '%(' num2str(n1) '/' num2str(Z) ')'])
disp(['测试集正确率Accuracy = ' num2str(Accuracytest) '%(' num2str(n2) '/' num2str(z) ')'])

toc

