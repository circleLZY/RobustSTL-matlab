clear all; close all; clc;
addpath('sample_generator');
addpath('RobustSTL');
addpath('RobustSTL/utils');
addpath('RobustSTL/L1Minimization');

[sample, trends, seasons, noise] = sample_generation(750, 50, 'stair', 1, 'random', 3, 10, 6, 'random', 4, 0, 0.316);
[input, trends_hat, seasons_hat, remainders_hat] = robustSTL(sample, 50, 10.0, 0.5, 2, 5, 1, 1, 50, 1);

figure();
subplot(4, 1, 1);
plot(input, 'b', 'linewidth',2, 'markersize',5);
subplot(4, 1, 2);
plot(input, 'r', 'linewidth',2, 'markersize',5);
hold on;
plot(trends_hat, 'b', 'linewidth',2, 'markersize',5);
title('trend');
subplot(4, 1, 3);
plot(seasons_hat, 'r', 'linewidth',2, 'markersize',5);
title('season');
subplot(4, 1, 4);
plot(remainders_hat, 'r', 'linewidth',2, 'markersize',5);
title('noise');
