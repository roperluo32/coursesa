function [J, grad] = linearRegCostFunction(X, y, theta, lambda)
%LINEARREGCOSTFUNCTION Compute cost and gradient for regularized linear 
%regression with multiple variables
%   [J, grad] = LINEARREGCOSTFUNCTION(X, y, theta, lambda) computes the 
%   cost of using theta as the parameter for linear regression to fit the 
%   data points in X and y. Returns the cost in J and the gradient in grad

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost and gradient of regularized linear 
%               regression for a particular choice of theta.
%
%               You should set J to the cost and grad to the gradient.
%

reg_theta = [0;theta(2:end, :)];   %用于计算正规项的theta，把第一项置为0，因为bias不需要正规化
h = X * theta; % X:m*n, theta:n*1, h:m*1
J = sum((h - y) .^ 2) / (2 * m) + (lambda * sum(reg_theta .^ 2)) / (2 * m); % J:1

grad = X' * (h - y) / m + lambda * reg_theta / m;









% =========================================================================

grad = grad(:);

end
