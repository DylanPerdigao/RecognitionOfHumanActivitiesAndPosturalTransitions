% load data_users

[avg_prev_freq_diff, std_prev_freq_diff] = calculate_prevalent_freq_diff(data, fs);

hold on;
%% select walking
avg_walking = avg_prev_freq_diff(1);
std_walking = std_prev_freq_diff(1);

%% select upstairs
avg_up = avg_prev_freq_diff(2);
std_up = std_prev_freq_diff(2);

%% select downstairs
avg_down = avg_prev_freq_diff(3);
std_down = std_prev_freq_diff(3);

%% plot gaussians
hold on;
x = linspace(-1, 1, 100);

ywalking = normpdf(x, avg_walking,  std_walking);
plot(x,ywalking);

yup = normpdf(x, avg_up, std_up);
plot(x,yup);


ydown = normpdf(x, avg_down, std_down);
plot(x,ydown);

title('Difference between average prevalent frequency on X and Y axis');

%% create classification rule
%there is no difference between x and y axis accelerometer values while
%walking

%% distinguish between walking upstairs and downstairs Z axis
close all;
eixo = 3;

[avg_prev_freq_2, std_prev_freq_2] = calculate_prevalent_freq(data, fs, 2);

hold on;

%% select upstairs
avg_up = avg_prev_freq_2(2, eixo);
std_up = std_prev_freq_2(2, eixo);

%% select downstairs
avg_down = avg_prev_freq_2(3, eixo);
std_down = std_prev_freq_2(3, eixo);

%% plot gaussians
hold on;
x = linspace(-1, 8, 100);
yup = normpdf(x, avg_up, std_up);
plot(x,yup);


ydown = normpdf(x, avg_down, std_down);
plot(x,ydown);

title('Average second prevalent frequency on Z axis');

%% create classification rule
% rule is intersection between gaussian density functions, taken from the
% plot, x = 1.952
% if prevalent frequency on X axis is greater than 0.118, it's a transition
% activity
rule = 1.952;
xline(rule,'--');
legend('Walking Upstairs', 'Walking Downstairs', 'decision rule', 'Location', 'northeast');

FN = normcdf(rule, avg_down, std_down);
TP = 1 - FN;
TN = normcdf(rule, avg_up, std_up);
FP = 1 - TN;
sens = TP/(TP+FN);
spec = TN/(TN+FP);
text(rule+0.05, .85, sprintf('x = %.4f', rule));
text(rule+0.05, .8, sprintf('sensibility = %.1f%%', sens*100));
text(rule+0.05, .75, sprintf('specificity = %.1f%%', spec*100));