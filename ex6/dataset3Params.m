function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%

trythese = [0.01; 0.03; 0.1; 0.3; 1; 3; 10; 30];
trytheselen=length(trythese);
results = zeros((trytheselen^2),3);
iter=0;

for i = 1:trytheselen
  C = trythese(i);
  for i = 1:trytheselen
    iter +=1
    sigma = trythese(i);
    model = svmTrain(X, y, C, @(x1, x2) gaussianKernel(x1, x2, sigma));
    predictions = svmPredict(model, Xval);
    error = mean(double(predictions ~= yval));
    results(iter,:) = [C, sigma, error];
  endfor
endfor
results
[minval, row] = min(min(results,[],3));
 bestresults=results(row(3),:)
 C = bestresults(1)
 sigma = bestresults(2)
 errorval = bestresults (3)
 



% =========================================================================

end
