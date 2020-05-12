function [media_prevalent_freq, desvio_prevalent_freq] = calculate_prevalent_freq(data, fs, ordem)
    if nargin ~= 3
        ordem = 1;
    end
    media_prevalent_freq = zeros(12,3);
    desvio_prevalent_freq = zeros(12,3);
    all_prev_freq = zeros(10,1);
    for atividade = 1:12
        for eixo = 1:3
            for user = 1:10
                all_prev_freq(user) = find_prevalent_frequency(data{user}.dfts{atividade, eixo}, fs, ordem);
            end
            media_prevalent_freq(atividade, eixo) = mean(nonzeros(all_prev_freq));
            desvio_prevalent_freq(atividade, eixo) = std(nonzeros(all_prev_freq));
        end
    end
end