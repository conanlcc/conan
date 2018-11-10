function [ w, iterations ] = perceptron_learn( data_in )
%perceptron_learn Run PLA on the input data
%   Inputs: data_in: Assumed to be a matrix with each row representing an
%                    (x,y) pair, with the x vector augmented with an
%                    initial 1, and the label (y) in the last column
%   Outputs: w: A weight vector (should linearly separate the data if it is
%               linearly separable)
%            iterations: The number of iterations the algorithm ran for
 S=size(data_in);
 r=S(:,1);%r=row of data_in
 c=S(:,2);%c=column of data_in
 X_=data_in(:,1:c-1);% get X part from data_in
 Y_=data_in(:,c);% get Y part from data_in
 w=zeros(c-1,1);           
  i=1;
  t=0;
  while (i<=r) %r=N, make the loop go over all conditions          
      Xn=X_(i,:);
     if sign(Xn*w)~=Y_(i,:) 
         w=w+(Y_(i,:)*(Xn'));  %the update rule
         i=1;% start from the beginning i=1 when update rule is used
         t=t+1;% iteration get counted here
     else
         i=i+1;% satisfy rule, move to next i
     end
  end
iterations=t;



end

