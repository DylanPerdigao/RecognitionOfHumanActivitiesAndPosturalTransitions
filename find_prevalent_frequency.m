function freq = find_prevalent_frequency(atividade, fs, ordem)
    if nargin ~= 3
       ordem = 1;
    end
    if size(atividade,1) ~= 0
        at = abs(atividade);
        [sorted_at, I] = sort(at, 'descend');
        indice = I(ordem*2-1);
%         max_magnitude = max(abs(atividade));
%         indice = find(abs(atividade)==max_magnitude, 1);
        f = linspace(-fs/2,fs/2, numel(atividade));
        freq = abs(f(indice));
    else
        freq = 0;
    end
end

