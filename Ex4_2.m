[avg_steps, std_steps] = calculate_steps(data, fs);
% considerar apenas eixo X
hold on;
for atividade = 1:3
    a = avg_steps - 3*std_steps;
    b = avg_steps + 3*std_steps;
    x = linspace(a(atividade,1),b(atividade,1),100);
    y = normpdf(x, avg_steps(atividade,1), std_steps(atividade,1));
    plot(x,y);
    title('Normal Distribution of Steps per activity');
    xlabel("Number of steps");
    ylabel("Probability Density");
end
legend('Walking', 'Walking Upstairs', 'Walking Downstairs');
hold off;