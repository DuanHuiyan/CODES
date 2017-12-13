function [ypred,maxi,ypredMat]=svmmultival(x,xsup,w,b,nbsv,kernel,kerneloption)

% USAGE ypred=svmmultival(x,xsup,w,b,nbsv,kernel,kerneloption)
% 
% Process the class of a new point x of a one-against-all 
% or a all data at once MultiClass SVM
% 
% This function should be used in conjuction with the output of
% svmmulticlass.
%
%
% See also svmmulticlass, svmval
%

% 29/07/2000 Alain Rakotomamonjy


[n1,n2]=size(x);
nbclass=length(nbsv);   %%类别数木 nbsv 储存每个分类器的支持向量的个数
y=zeros(n1,nbclass);    %%产生样本数目*类别数目的0矩阵是干嘛呢 
nbsv=[0 nbsv];         %% 为何在nbsv前面加上一个0呢
aux=cumsum(nbsv);    %cumsum是求向量的累加和 如A=[0 1 2 3]； 用cumsum求就是 cumsum(A)=[0 1 3 6]; 第一个数是0 第二个数是第一个分类器支持向量数 第三个是1+2的 第四个是总的支持向量机数目
%%aux的目的何在？

for i=1:nbclass
    if ~isempty(xsup) %%如果存在xsup支持向量
         xsupaux=xsup(aux(i)+1:aux(i)+nbsv(i+1),:);%%见第22行aux是一个向量存储支持向量数目的累加，这个是产生相应的分类器的支持向量
        % 
        waux=w(aux(i)+1:aux(i)+nbsv(i+1)); %%产生相应的分类器的权值
        baux=b(i);  %产生响应的偏置
        ypred(:,i)= svmval(x,xsupaux,waux,baux,kernel,kerneloption);  %%训练子分类器
    else
      if isempty(x)  %  Kernel matrix is given as a parameter 不存在x就执行
        waux=w(aux(i)+1:aux(i)+nbsv(i+1));
        baux=b(i);
        kernel='numerical';
        xsupaux=[];
        pos=aux(i)+1:aux(i)+nbsv(i+1);
        kerneloption2.matrix=kerneloption.matrix(:,pos);
        ypred(:,i)= svmval(x,xsupaux,waux,baux,kernel,kerneloption2);   %%加入就输出一个x=1,2 那么y也就一行 0,1 2 取最大值为类别
      end;
    end;
   
end;
ypredMat=ypred;
[maxi,ypred]=max(ypred');
maxi=maxi';
ypred=ypred';
