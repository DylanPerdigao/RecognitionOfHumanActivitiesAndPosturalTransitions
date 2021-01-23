function centroid = find_spectral_centroid(atividade, fs)
    if size(atividade,1) ~= 0
        max_magnitude = max(abs(atividade));
        f = linspace(-fs/2,fs/2, numel(atividade));
        indices = find(f>0);
        atividade = atividade(indices);
        f = f(indices);
        indices = find(abs(atividade) > 0.3*max_magnitude);
        atividade = atividade(indices);
        f = f(indices);
        
        centroid = abs(atividade).*f';
        centroid = sum(centroid);
        centroid = centroid/sum(abs(atividade));
        centroid = abs(centroid);
    else
        centroid = 0;
    end
end
