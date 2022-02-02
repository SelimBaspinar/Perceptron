function [w]=Perceptron(xtrain,ytrain,winit,meu)
xtrain=xtrain';
ytrain=ytrain';

ytrain(1:100)=-1;
ytrain(101:200)=1;




epochs = 20; 
iterations = size(xtrain,1); 



X = [xtrain, ones(size(xtrain,1),1)]; % input and bias
W = winit;
Y = tansig(X*W);   



for epoch = 1:epochs
    for i = 1:iterations
        v = X(i,:)*W;
        pred_class = tansig(v);
        pred_error = ytrain(i,1)-pred_class; 
        W = W + meu*dtansig(v,pred_class) *X(i,:)'*pred_error;
    end
end
w=W;




    
end
