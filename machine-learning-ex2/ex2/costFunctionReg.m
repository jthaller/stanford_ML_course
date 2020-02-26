function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

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

% h=sigmoid(X*theta);
% cost = log(h.')*(-y) - log(1-h.')*(1-y);
% J = 1/m *sum(cost) +  lambda/(2*m) *sum(theta(2:end,:).^2);

%no sums
z=X*theta;
h=sigmoid(z);
H=h.';
h1=log(H)*(-y);
h2=(log(1-H))*(1-y);
reg=theta.^2;
%only don't include theta_0 in the sum. it doesn't get
%added to the regularization part.
reg = sum(reg(2:end,:))
J=(h1-h2)/m + lambda/(2*m)*reg;

grad = 1/m * sum((h-y).*X);
grad = grad';
% grad(1) = grad(1) + (lambda/m).*theta(1,:);
grad(2:end,:) = grad(2:end,:) + (lambda/m).*theta(2:end,:);




% =============================================================

end
