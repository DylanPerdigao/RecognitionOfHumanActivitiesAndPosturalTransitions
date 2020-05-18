% load data_users
fs = 50;
for eixo = 1:3
    figure();
    i = 1;
    for at = 1:12
        subplot(3, 4, i);
        i = i + 1;
        represent_dft(data{1}.dfts{at, eixo}, fs, sprintf("eixo: %c - atividade %d", char('X'+eixo-1), at), true);
        xlabel("Frequência (Hz)");
        ylabel("Magnitude");
    end
end
