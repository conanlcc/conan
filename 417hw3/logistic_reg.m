function [ w, e_in, functionTime ] = logistic_reg( X, y, w_init, max_its, eta )
%LOGISTIC_REG Learn logistic regression model using gradient descent
%   Inputs:
%       X : data matrix (without an initial column of 1s)
%       y : data labels (plus or minus 1)
%       w_init: initial value of the w vector (d+1 dimensional)
%       max_its: maximum number of iterations to run for
%       eta: learning rate
    
%   Outputs:
%       w : weight vector
%       e_in : in-sample error (as defined in LFD)
% %  Use a learning rate  = 10?5 and automatically terminate the algorithm if
% %  the magnitude of each term in the gradient is below 10?3 at any step.
w = w_init;
X_with_one = [ones(size(X,1),1) X];
global x
N=size(X_with_one,1);
M=size(X_with_one,2);
now1 = tic();
for iter=0 : max_its
    grad=zeros(N,M);
    for i = 1 : N
        grad(i,:)=(-1/N) * y(i).*X_with_one(i,:) / (1 + exp(y(i)*(X_with_one(i,:)*w)));
    end
    gradient = sum(grad);
    w = w - eta * gradient'; 
    
    if (abs(gradient) < 10^(-6))
        x=iter;
        break
    end
   
end

error_sum=0;
for n=1:N
    error_sum=error_sum+log(1+exp(-y(n)*[1 X(n,:)]*w));
end
e_in = error_sum / N;  
functionTime = toc(now1);
end



