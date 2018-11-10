clc;
clear;
%get data clevelandtrain
file_train = 'clevelandtrain.csv';
data_of_Xytrain = csvread(file_train, 1, 0 );
tail_train=size(data_of_Xytrain,2);
X_train = data_of_Xytrain(:,1:tail_train - 1);
y_train = data_of_Xytrain(:,tail_train);
%converting y_train from {0,1} to {-1,1}
y_train = y_train - (y_train==0);
%y_train_b {0,1} for glmfit function
y_train_glmfit = data_of_Xytrain(:,tail_train);

%get data clevelandtest
file_test = 'clevelandtest.csv';
data_of_Xytest = csvread(file_test, 1, 0 );
tail_test=size(data_of_Xytest,2);
X_test = data_of_Xytest(:,1:tail_test - 1);
y_test = data_of_Xytest(:,tail_test);
y_test = y_test - (y_test==0);

w_init = zeros(tail_test,1);
eta = 10^(-4);
%Q1
%the place to change the num of iterations
% max_its = 10^4;
% max_its = 10^5;
% max_its = 10^6;
% [ w, e_in,functionTime] = logistic_reg( X_train, y_train, w_init, max_its, eta);
% [ test_error_train] = find_test_error( w, X_train, y_train );
% [ test_error_test] = find_test_error( w, X_test, y_test );
%Q2
%the place to change the num of iterations
% max_its = 10^4;
% max_its = 10^5;
% max_its = 10^6;
% tic;
% w_glmfit = glmfit(X_train, y_train_glmfit, 'binomial')';
% time_for_glm = toc;
% w_glm=w_glmfit';
% X_with_one = [ones(size(X_train,1),1) X_train];
% N=size(X_with_one,1);
% [ test_error_train_glm] = find_test_error( w_glm, X_train, y_train );
% [ test_error_test_glm] = find_test_error( w_glm, X_test, y_test );
%Q3
global x
max_its = 10^10;
z_train = zscore(X_train);
z_test = zscore(X_test);
[ w_q3, e_in_q3, functionTime_q3] = logistic_reg( z_train, y_train, w_init, max_its, eta);
[ test_error_train] = find_test_error( w_q3, z_train, y_train );
[ test_error_test] = find_test_error( w_q3, z_test, y_test );
x


