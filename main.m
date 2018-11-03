%Acknowledgement:
%Highly appreciate to Yifeng Hong who taught me how to construct a matlab
%project with a correct and effective way and how to debug in an accurate
%way. His dedication really made me understand what I should do to improve
%my matlab skill.

%Input parameters:( N, d, num_samples )
[A, B]=perceptron_experiment ( 100,10, 1000 );
%  hist(num_iters)=hist(A) 
%  hist(log(bounds-num_iters))=hist(log(B-A))
%bound_minus_ni is the difference between the theoretical bound and the actual number of iterations
figure(1);hist(A);figure(2);hist(log(B-A))
%figure 1 is the histogram of the number of iterations the algorithm takes to learn a linear separator
%figure 2 is the histogram of the log of this difference between the bound and the number of iterations


