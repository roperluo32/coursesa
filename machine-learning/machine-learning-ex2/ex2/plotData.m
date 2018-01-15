function plotData(X, y)
%PLOTDATA Plots the data points X and y into a new figure 
%   PLOTDATA(x,y) plots the data points with + for the positive examples
%   and o for the negative examples. X is assumed to be a Mx2 matrix.

% Create New Figure
figure; hold on;

% ====================== YOUR CODE HERE ======================
% Instructions: Plot the positive and negative examples on a
%               2D plot, using the option 'k+' for the positive
%               examples and 'ko' for the negative examples.
%

z = [X,y];
[r,c] = find(z(:,3) == 1);
one_plots = z(r,:);
nx = one_plots(:,1);ny = one_plots(:,2);
plot(nx, ny, 'k+')

[r,c] = find(z(:,3) == 0);
zero_plots = z(r,:);
nx = zero_plots(:,1);ny = zero_plots(:,2);
hold on;
plot(nx, ny, 'ko')







% =========================================================================



hold off;

end
