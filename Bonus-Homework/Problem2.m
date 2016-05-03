% CSE847 Homework #6 Problem 2-1

clear all;
clc;
close all;

image = imread('Trees_test.JPG');
image = im2double(image);
channel_r = image(:, :, 1);
channel_r = channel_r(:);
idx_to_remove = randperm(size(channel_r, 1), size(channel_r, 1)/2);
ranks =0:5:30;
ranks(1)=1;
errors = zeros(3, size(ranks, 2));
X_impute = {};
channel_names={'red', 'green', 'blue'};
for i = 1:3
    lossy_img = image(:, :, i);
    figure
    subplot(3, 3, 1)
    imshow(image(:, :, i), 'InitialMagnification', 100);
    title(sprintf('%s channel', channel_names{i}));
    lossy_img = lossy_img(:);
    lossy_img(idx_to_remove) = 0;
    lossy_img = reshape(lossy_img, [128 128 1]);
    subplot(3, 3, 2)
    imshow(lossy_img, 'InitialMagnification', 100)
    title('50% samples removed')
    omega = lossy_img == 0;

    for j = 1:size(ranks, 2)
        X_impute{i, j} = hardimpute(lossy_img, omega, ranks(j));
        subplot(3, 3, j + 2)
        imshow(X_impute{i}, 'InitialMagnification', 100)
        title(sprintf('rank = %d', ranks(j)));
        pause(1)
        errors(i, j) = norm(X_impute{i} - lossy_img)^2;
    end
end

colors = {};
figure
subplot(3, 3, 1)
imshow(image, 'InitialMagnification', 100)
title('Original Image')
for i = 1:7
    temp = zeros(size(image));
    temp(:, :, 1) = X_impute{1, i};
    temp(:, :, 2) = X_impute{2, i};
    temp(:, :, 3) = X_impute{3, i};
    colors{i} = temp;
    subplot(3, 3, i+1)
    imshow(temp, 'InitialMagnification', 100);
    title(sprintf('rank = %d', ranks(i)));
end