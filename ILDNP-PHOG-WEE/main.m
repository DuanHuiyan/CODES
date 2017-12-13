%%����������ͼ���
clc
tic;
% %%
%trainFeature2;
%testFeature2; 
load featureILDNtrainPHOG33;
load featureILDNtestPHOG33;
train_label=load('train_label.txt');
test_label=load('test_label.txt');


%% SVM-KM����
addpath SVM-KM  %%���֧��������������
c = 800;
lambda = 1e-3;
kerneloption= 0.013;   %���ú˲���
kernel='poly'; %����֧���������ĺ˺���
verbose = 0;
nbclass=4;
[xsup,w,b,nbsv]=svmmulticlassoneagainstall(P_train3,train_label,nbclass,c,lambda,kernel,kerneloption,verbose); %ʹ��֧������������ѵ�����֧������
[ypred1,maxi] = svmmultival(P_train3,xsup,w,b,nbsv,kernel,kerneloption);  %ѵ��������
[ypred2,maxi] = svmmultival(P_test3,xsup,w,b,nbsv,kernel,kerneloption);   %���Լ�����
CC1=ypred1-train_label;
n1=length(find(CC1==0));
Z =length(train_label);
CC2=ypred2-test_label;
n2=length(find(CC2==0));
z=size(test_label,1);
Accuracytrain=n1/size(train_label,1)*100 ;  %ͳ��ѵ������
Accuracytest=n2/size(test_label,1)*100 ;    %ͳ�Ʋ��Ծ���
disp('LBP-TOP SVM-KMʶ��Ч�����£�');
disp(['ѵ������ȷ��Accuracy = ' num2str(Accuracytrain) '%(' num2str(n1) '/' num2str(Z) ')'])
disp(['���Լ���ȷ��Accuracy = ' num2str(Accuracytest) '%(' num2str(n2) '/' num2str(z) ')'])

toc

