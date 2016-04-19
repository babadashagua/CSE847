% Calculate PCA reconstruction error
% Parameters: 
% coeff: principle conponents
% A: raw data set
% p: the number of principle conponents selected
% N: dataset entry, for average of reconstruction error

function reconstruction_error = reconstruction_error_cal(coeff,A,p,N)

reconstruction_error = 0;
[row,col] = size(A);

for i = 1:N
    reconstruction = zeros(col,1);
    for j = 1:p
        weight = dot(A(1,:)',coeff(:,j));
        reconstruction = reconstruction + weight*coeff(:,j);
    end
    
    reconstruction_error = reconstruction_error + norm(A(1,:)' - reconstruction);
end

reconstruction_error = reconstruction_error/N;

end