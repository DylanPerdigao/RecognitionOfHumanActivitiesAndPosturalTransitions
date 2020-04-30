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
x = linspace(avg_din - 3*std_din, avg_din + 3*std_din, 100);
y = normpdf(x, avg_din,  std_din);
plot(x,y);

x = linspace(avg_other - 3*std_other, avg_other + 3*std_other, 100);
y = normpdf(x, avg_other, std_other);
plot(x,y);


title('Average prevalent frequency by activity type');
legend('Dynamic', 'Others');
hold off;

%% do statistical test for separability





