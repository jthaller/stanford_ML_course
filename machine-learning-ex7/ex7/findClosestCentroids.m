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

dist_to_centroid = zeros(K);
for pt = 1:size(X,1) %loop over every example
    for c = 1:K %for each example find the nearest centroid
        dist_to_centroid(c,1) =  ( X(c,1) - centroids(pt,1) ).^2 + ( X(c,2) - centroids(pt,2) ).^2 ;
    end
    [min_dist best_centroid_index] = min(dist_to_centroid);
    idx(pt,1) = best_centroid_index;
end






% =============================================================

end

