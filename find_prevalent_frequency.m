function freq = find_prevalent_frequency(atividade, fs)
    max_magnitude = max(abs(atividade));
    indice = find(abs(atividade)==max_magnitude, 1);
    f = linspace(-fs/2,fs/2, numel(atividade));
    freq = abs(f(indice));
end

