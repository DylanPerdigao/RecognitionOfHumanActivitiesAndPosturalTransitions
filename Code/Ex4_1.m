user = 1;
atividade = 12;
eixo = 1;
hold on
sgtitle(sprintf("User: %d - Eixo: %c - Atividade: %d", user, char('X'+eixo-1), atividade));
subplot(3, 3, 1);
represent_dft(data{user}.dfts{atividade,eixo}, fs, 'Simple', true);
xlabel("Frequência (Hz)");
ylabel("Magnitude");
subplot(3, 3, 2);
represent_dft(data{user}.dfts_hamming{atividade,eixo}, fs, 'Hamming', true);
xlabel("Frequência (Hz)");
ylabel("Magnitude");
subplot(3, 3, 3);
represent_dft(data{user}.dfts_hann{atividade,eixo}, fs, 'Hann', true);
xlabel("Frequência (Hz)");
ylabel("Magnitude");
subplot(3, 3, 4);
represent_dft(data{user}.dfts_blackman{atividade,eixo}, fs, 'Blackman', true);
xlabel("Frequência (Hz)");
ylabel("Magnitude");
subplot(3, 3, 5);
represent_dft(data{user}.dfts_gaussian{atividade,eixo}, fs, 'Gaussian', true);
xlabel("Frequência (Hz)");
ylabel("Magnitude");
subplot(3, 3, 6);
represent_dft(data{user}.dfts_triang{atividade,eixo}, fs, 'Triangular', true);
xlabel("Frequência (Hz)");
ylabel("Magnitude");



