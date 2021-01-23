function [medias, desvios] = calculate_steps(data, fs)
    freq = zeros(10,3);
    medias = zeros(3, 3); %Contem medias de freq_prevalente para cada eixo e cada atividade dinamica
    desvios = zeros(3, 3); %Contem desvios padrão de freq_prevalente para cada eixo e cada atividade dinamica
    for atividade = 1:3
        for i = 1:10
            for eixo = 1:3
                freq(i, eixo) = find_prevalent_frequency(data{i}.dfts{atividade,eixo}, fs);
            end
        end
        medias(atividade,:) = mean(freq);
        desvios(atividade,:) = std(freq);
    end
    medias = medias*60;
    desvios = desvios*60;
end