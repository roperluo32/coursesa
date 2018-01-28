function [J, grad] = cofiCostFunc(params, Y, R, num_users, num_movies, ...
                                  num_features, lambda)
%COFICOSTFUNC Collaborative filtering cost function
%   [J, grad] = COFICOSTFUNC(params, Y, R, num_users, num_movies, ...
%   num_features, lambda) returns the cost and gradient for the
%   collaborative filtering problem.
%

% Unfold the U and W matrices from params
X = reshape(params(1:num_movies*num_features), num_movies, num_features);   %  X:n_m*n_fe
Theta = reshape(params(num_movies*num_features+1:end), ...					%  Theta: n_u*n_fe
                num_users, num_features);   

            
% You need to return the following values correctly
J = 0;
X_grad = zeros(size(X));				% X_grad:n_m*n_fe
Theta_grad = zeros(size(Theta));		% Theta_grad:n_u*n_fe

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost function and gradient for collaborative
%               filtering. Concretely, you should first implement the cost
%               function (without regularization) and make sure it is
%               matches our costs. After that, you should implement the 
%               gradient and use the checkCostFunction routine to check
%               that the gradient is correct. Finally, you should implement
%               regularization.
%
% Notes: X - num_movies  x num_features matrix of movie features
%        Theta - num_users  x num_features matrix of user features
%        Y - num_movies x num_users matrix of user ratings of movies
%        R - num_movies x num_users matrix, where R(i, j) = 1 if the 
%            i-th movie was rated by the j-th user
%
% You should set the following variables correctly:
%
%        X_grad - num_movies x num_features matrix, containing the 
%                 partial derivatives w.r.t. to each element of X
%        Theta_grad - num_users x num_features matrix, containing the 
%                     partial derivatives w.r.t. to each element of Theta
%

item = (((X * Theta') - Y) .* R);   %item: n_m*n_u
regu_X = sum((X.^2)(:)) * lambda / 2;
regu_Theta = sum((Theta.^2)(:)) * lambda / 2;
J = sum((item.^ 2)(:))/2 + regu_X + regu_Theta;  %n_m*n_u
X_grad = item * Theta + lambda * X;  % item:n_m*n_u  Theta: n_u*n_f  X:n_m*n_f
Theta_grad = item' * X + lambda * Theta; % item:n_m*n_u X:n_m*n_f  Theta:n_u*nf












% =============================================================

grad = [X_grad(:); Theta_grad(:)];

end
