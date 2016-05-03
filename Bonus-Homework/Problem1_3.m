% CSE847 Homework #6 Problem 1-3

clear all;
clc;
close all;

load ad_data.mat;
load feature_name.mat;

par = [1e-8,0.01,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1];

opts.rFlag = 1; % range of par within [0, 1].
opts.tol = 1e-6; % optimization precision
opts.tFlag = 4; % termination options.
opts.maxIter = 500; % maximum iterations.

[bootstat,bootsam] = bootstrp(1000,@mean,X_train);
[row_train,col_train] = size(X_train);
[row_par,col_par] = size(par);
selection_probability = zeros(col_train, col_par);

n_bootstraps = 500;

for  k = 1:length(par)
    count = zeros(col_train,1);
    for i = 1:n_bootstraps
        [x, c, funVal, ValueL]=LogisticR(X_train(bootsam(:, i), :), y_train, par(k), opts);
%         weights = [c;x];
        index = find(x~=0);
        count(index) = count(index)+1;
    end
    
    selection_probability(:,k) = count/n_bootstraps;
end

[probability, index_2] = sort(max(selection_probability, [], 2), 'descend');

for k = 1:20
    top_20_features = sprintf('%-20s %.3f', FeatureNames_PET{index_2(k)}, probability(k));
    disp(top_20_features);
end


