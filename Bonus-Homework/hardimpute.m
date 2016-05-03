% CSE847 Homework #6 Problem 2-1

function [X_complete] = hardimpute(X_missing, Omega, r)
% Input:
%   X_missing -- a m-by-n input matrix, only values at Omega
%   Omega     -- a m-by-n binary matrix, indicating location of the missing values
%   r         -- rank

Z_new = zeros(size(X_missing));
Z_old = Z_new;

for i = 1:r
    Z_old(Omega)=0;
    X = X_missing+Z_old;
    [U,S,V] = svd(X);
    Z_new = U(:,1:i)*S(1:i,1:i)*V(:,1:i)';
    Z_old = Z_new;
end
X_complete = Z_new;
end