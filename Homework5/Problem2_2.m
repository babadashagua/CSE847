% CSE847 Homework 5 Problem 2 (2)

clc;
close all;
clear all;

load USPS.mat;

coeff = pca(A);

[row,col] = size(A);
p = [10,50,100,200];

for i = 1:4
    reconstruction_error(i) = reconstruction_error_cal(coeff,A,p(i),row);
end



%%
figure(1)
plot(p,reconstruction_error,'LineWidth',2);
xlabel('Principle components number');
ylabel('Reconstruction error');

%% reconstruction p = 10

for i = 1:2
reconstruction = zeros(col,1);
    for j = 1:p(1)
        weight = dot(A(i,:)',coeff(:,j));
        reconstruction = reconstruction + weight*coeff(:,j);
    end

    figure(i)
    reconstruction_image = reshape(reconstruction,16,16);
    imshow(reconstruction_image');

end

%% p = 50

for i = 1:2
reconstruction = zeros(col,1);
    for j = 1:p(2)
        weight = dot(A(i,:)',coeff(:,j));
        reconstruction = reconstruction + weight*coeff(:,j);
    end

    figure(i)
    reconstruction_image = reshape(reconstruction,16,16);
    imshow(reconstruction_image');

end

%% p = 100

for i = 1:2
reconstruction = zeros(col,1);
    for j = 1:p(3)
        weight = dot(A(i,:)',coeff(:,j));
        reconstruction = reconstruction + weight*coeff(:,j);
    end

    figure(i)
    reconstruction_image = reshape(reconstruction,16,16);
    imshow(reconstruction_image');

end

%% p = 200

for i = 1:2
reconstruction = zeros(col,1);
    for j = 1:p(4)
        weight = dot(A(i,:)',coeff(:,j));
        reconstruction = reconstruction + weight*coeff(:,j);
    end

    figure(i)
    reconstruction_image = reshape(reconstruction,16,16);
    imshow(reconstruction_image');

end