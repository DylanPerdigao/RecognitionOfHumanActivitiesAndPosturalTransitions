%load data_users

[avg_prevalent_freq, std_prevalent_freq] = calculate_prevalent_freq(data, fs);
hold on;

eixo = 1;
%% join dynamic activities in group
avg_din = 0;
std_din = 0;
for at = 1:3
    avg_din = avg_din + avg_prevalent_freq(at,eixo);
    std_din = std_din + std_prevalent_freq(at,eixo)^2;
end
avg_din = avg_din/3;
std_din = sqrt(std_din/3);

%% join other activities in group
avg_other = 0;
std_other = 0;
for at = 4:12
    avg_other = avg_other + avg_prevalent_freq(at,eixo);
    std_other = std_other + std_prevalent_freq(at,eixo)^2;
end
avg_other = avg_other/9;
std_other = sqrt(std_other/9);

%% plot gaussians
hold on;
x = linspace(-2, 3, 100);

ydin = normpdf(x, avg_din,  std_din);
plot(x,ydin);

yother = normpdf(x, avg_other, std_other);
plot(x,yother);


title('Average prevalent frequency by activity type on X axis');

%% create classification rule
% rule is intersection between gaussian density functions, taken from the
% plot, x = 1.2323
% if prevalent frequency on X axis is greater than 1.2323, it's a dynamic
% activity
rule = 1.2323;
xline(rule,'--');
legend('Dynamic', 'Others', 'decision rule', 'Location', 'northwest');

% TP = P(din > rule)
% FN = P(din < rule)
% FP = P(other > rule)
% TN = P(other < rule)
FN = normcdf(rule, avg_din, std_din);
TP = 1 - FN;
TN = normcdf(rule, avg_other, std_other);
FP = 1 - TN;
sens = TP/(TP+FN);
spec = TN/(TN+FP);
text(rule, 1.9, sprintf('x = %.4f', rule));
text(-0.2, 1.9, sprintf('sensibility = %.1f%%', sens*100));
text(-0.2, 1.8, sprintf('specificity = %.1f%%', spec*100));
