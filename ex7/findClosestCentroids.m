function idx = findClosestCentroids(X, centroids)
%FINDCLOSESTCENTROIDS computes the centroid memberships for every example
%   idx = FINDCLOSESTCENTROIDS (X, centroids) returns the closest centroids
%   in idx for a dataset X where each row is a single example. idx = m x 1 
%   vector of centroid assignments (i.e. each entry in range [1..K])
%

% Set K
K = size(centroids, 1);

% You need to return the following variables correctly.
idx = zeros(size(X,1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Go over every example, find its closest centroid, and store
%               the index inside idx at the appropriate location.
%               Concretely, idx(i) should contain the index of the centroid
%               closest to example i. Hence, it should be a value in the 
%               range 1..K
%
% Note: You can use a for-loop over the examples to compute this.
%

distances=zeros(size(X,1),K);

for i=1:K
  distances(:,i) = sqrt(sum((X - centroids(i, :)) .^ 2, 2));
endfor
[colMin, row] = min(distances');
idx=row';


%%the below works but not when submitted, suspect this is because there are more than 2 variables submitting.
%for i=1:length(X)
%  xx=X(i,1);
%  xy=X(i,2);
%  distances=zeros(K, 1);
%  for j=1:K
%    cx = centroids(j,1);
%    cy = centroids(j,2);
%    distances(j)=sqrt((cx-xx)^2*(cy-xy)^2);
%  endfor
%[lowestvalue, idx(i)]=min(distances);
%endfor

% =============================================================

end

