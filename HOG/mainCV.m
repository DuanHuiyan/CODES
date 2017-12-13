load featureHOGtrain1212;
load featureHOGtest1212;
train_label=load('train_label.txt');
test_label=load('test_label.txt');

%  P_train=mapminmax(P_train3,0,1);
%  P_test=mapminmax(P_test3,0,1);

train=P_train3;
test=P_test3;
bestcv=0;
for log2c=-10:10,
    for log2g=-10:10,
        cmd=['-v 5 -c ', num2str(2^log2c) ,' -g ' , num2str(2^log2g)];
        cv=svmtrain(train_label,train,cmd);
        if(cv>=bestcv),
            bestcv=cv;bestc=2^log2c;bestg=2^log2g;
        end
    end
end
fprintf('(best c=%g, g=%g,rate=%g)\n',bestc,bestg,bestcv);
cmd=[' -c ', num2str(bestc), ' -g ' num2str(bestg)];
model=svmtrain(train_label,train,cmd);


% model = svmtrain(train_label,train,'-s 0 -t 2 -c 1 -g 100');
[predict,accuracy, decision_values]=svmpredict(test_label,test,model);