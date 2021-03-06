function centroids = computeCentroids(X, idx, K)
%COMPUTECENTROIDS returns the new centroids by computing the means of the 
%data points assigned to each centroid.
%   centroids = COMPUTECENTROIDS(X, idx, K) returns the new centroids by 
%   computing the means of the data points assigned to each centroid. It is
%   given a dataset X where each row is a single data point, a vector
%   idx of centroid assignments (i.e. each entry in range [1..K]) for each
%   example, and K, the number of centroids. You should return a matrix
%   centroids, where each row of centroids is the mean of the data points
%   assigned to it.
%

% Useful variables
[m n] = size(X);

% You need to return the following variables correctly.
centroids = zeros(K, n);


% ====================== YOUR CODE HERE ======================
% Instructions: Go over every centroid and compute mean of all points that
%               belong to it. Concretely, the row vector centroids(i, :)
%               should contain the mean of the data points assigned to
%               centroid i.
%
% Note: You can use a for-loop over the centroids to compute this.
%

%note - this really is only for 3 centroids, which means if you wanted to
%do a different number you'd really have to change this method. Not a good
%solution, IMO - Jeremy
% centroid_1 = zeros(1,n); centroid_2 = zeros(1,n); centroid_3 = zeros(1,n);
% num_in_c1 = 0; num_in_c2 = 0; num_in_c3 = 0;
% 
% for x = 1:m
%     if idx(x) == 1
%         centroid_1 = centroid_1 + X(x,:);
%         num_in_c1 = num_in_c1 + 1; 
%     elseif idx(x) == 2
%         centroid_2 = centroid_2 + X(x,:);
%         num_in_c2 = num_in_c2 + 1;
%     else
%         centroid_3 = centroid_3 + X(x,:);
%         num_in_c3 = num_in_c3 + 1;
%     end
% end
% 
% centroids = [(1/num_in_c1 .* centroid_1);...
%     1/num_in_c2 .* centroid_2;...
%     1/num_in_c3 .* centroid_3];


%% Here's a better solution -Jeremy
for k = 1:K
  num_k = 0;
  sum_of_points = zeros(n, 1);
  for i = 1:m
    if ( idx(i) == k )
      sum_of_points = sum_of_points + X(i, :)';
      num_k = num_k + 1;
    end
  end
  centroids(k, :) = (sum_of_points/num_k)';
end





% =============================================================


end

