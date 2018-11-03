function [ num_iters, bounds] = perceptron_experiment ( N, d, num_samples )
%perceptron_experiment Code for running the perceptron experiment in HW1
%   Inputs: N is the number of training examples
%           d is the dimensionality of each example (before adding the 1)
%           num_samples is the number of times to repeat the experiment
%   Outputs: num_iters is the # of iterations PLA takes for each sample
%            bound_minus_ni is the difference between the theoretical bound
%               and the actual number of iterations
%      (both the outputs should be num_samples long)
 for num=1:num_samples
 X=ones(N,1);%create primary X
 w_optimal_part=(1).*rand(d,1);
 w_optimal=[0;w_optimal_part];% create w*
 for i=1:d
     X=[X (1).*rand(N,1)*2-1];
 end %Get X
 Y=sign(X*w_optimal); %Get Y
 data_in=[X Y];%create data_in
 [w, t]=perceptron_learn( data_in );% send data_in to perceptron_learn to get the iterations  
 num_iters_matrix(num)=t;% collect the iterations in the num_iters matrix
  for s=1:N
      p_each=[Y(s,:)*X(s,:)*w_optimal];
      p(s)=p_each;
      R_each=sqrt(sum(abs(X(s,:)).^2,2));
      R(s)=R_each;
  end%use the same way to collect all the p and R matrix
  roh_matrix(num)=min(p);%find the minimun of p/roh
  p_min=min(p);
  R_matrix(num)=max(R);% find the maxmum of R
  R_max=max(R);
  bound= R_max.^2 * sum(abs(w_optimal).^2,1) ./ p_min^2;% the rule provided by problem 1.3
  bound_matrix(num)=bound; % collect the bound under  all of num_samples' in a matrix , the same way was used in collecting roh and R
end
 bounds=bound_matrix;% output bounds
 num_iters=num_iters_matrix;%out put num_iters
end

