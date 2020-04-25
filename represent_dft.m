function represent_dft(atividade, fs)
    figure();
    f = linspace(-fs/2, fs/2, numel(atividade));
    plot(f, abs(atividade));
end