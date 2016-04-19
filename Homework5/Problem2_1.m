% CSE847 Homework 5 Problem 2 (1)

clc;
close all;
clear all;

x = [-3,-1,0,1,3];
y = [6,2,0,-2,-6];

figure(1)
for i = 1:5
    plot(x(i),y(i),'o','MarkerSize',15);hold on;
end