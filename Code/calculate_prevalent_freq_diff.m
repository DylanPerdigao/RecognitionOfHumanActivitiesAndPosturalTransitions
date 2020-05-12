function [media_prevalent_freq, desvio_prevalent_freq] = calculate_prevalent_freq_diff(data, fs)
    media_prevalent_freq = zeros(12,1);
    desvio_prevalent_freq = zeros(12,1);
    all_prev_freq = zeros(10,1);
    for atividade = 1:12
        for user = 1:10
            all_prev_freq(user) = find_prevalent_frequency(data{user}.dfts{atividade, 1}, fs);
            all_prev_freq(user) = all_prev_freq(user) - find_prevalent_frequency(data{user}.dfts{atividade, 2}, fs);
        end
        media_prevalent_freq(atividade) = mean(all_prev_freq);
        desvio_prevalent_freq(atividade) = std(all_prev_freq);
    end
end