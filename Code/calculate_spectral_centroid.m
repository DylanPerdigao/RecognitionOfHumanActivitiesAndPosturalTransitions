function [media_spectral_centroid, desvio_spectral_centroid] = calculate_spectral_centroid(data, fs)
    media_spectral_centroid = zeros(12,3);
    desvio_spectral_centroid = zeros(12,3);
    all_spectral_centroid = zeros(10,1);
    for atividade = 1:12
        for eixo = 1:3
            for user = 1:10
                all_spectral_centroid(user) = find_spectral_centroid(data{user}.dfts_gaussian{atividade, eixo}, fs);
            end
            media_spectral_centroid(atividade, eixo) = mean(nonzeros(all_spectral_centroid));
            desvio_spectral_centroid(atividade, eixo) = std(nonzeros(all_spectral_centroid));
        end
    end
end