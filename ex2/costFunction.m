function [J, grad] = costFunction(theta, X, y)
%COSTFUNCTION Compute cost and gradient for logistic regression
%   J = COSTFUNCTION(theta, X, y) computes the cost of using theta as the
%   parameter for logistic regression and the gradient of the cost
%   w.r.t. to the parameters.

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta
%
% Note: grad should have the same dimensions as theta
%

%Cost Func using a loop:
%tosum=zeros(m,1);
%for i = 1:m,
%  x = X(i,:)';
%  hthetax = sigmoid(theta'*x);
%  tosum(i) = (-y(i)*log(hthetax))-((1-y(i))*log(1-hthetax));
%endfor
%J=1/m*sum(tosum);

%Cost Function, vectorised:
J = (1/m) * (-y' * log(sigmoid(X * theta)) - (1 - y)' * log(1-sigmoid(X * theta)));

%Gradient Descent using nested loops (complicated, also not working):
%tosumgrad=zeros(m,1)
%for j = 2:length(theta),
%  for i = 1:m,
%    x=X(i,:)';
%    tosumgrad(i)=(sigmoid(theta'*x)-y(i))*x(j);
%  endfor
%  grad(j)=1/m*sum(tosumgrad)
%endfor

%Gradient Descent, vectorised:
grad = (1/m) * X'* (sigmoid(X*theta) - y);




% =============================================================

end
