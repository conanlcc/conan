function [ test_error ] = find_test_error( w, X, y )
%FIND_TEST_ERROR Find the test error of a linear separator
%   This function takes as inputs the weight vector representing a linear
%   separator (w), the test examples in matrix form with each row
%   representing an example (X), and the labels for the test data as a
%   column vector (y). X does not have a column of 1s as input, so that 
%   should be added. The labels are assumed to be plus or minus one. 
%   The function returns the error on the test examples as a fraction. The
%   hypothesis is assumed to be of the form (sign ( [1 x(n,:)] * w )
X_with_one = [ones(size(X,1),1) X];
N_without_one=size(X,1);
h=X_with_one*w;
h_linear=sign(h);
error_linear=sum(h_linear~=y) / N_without_one;
test_error=error_linear;

end

