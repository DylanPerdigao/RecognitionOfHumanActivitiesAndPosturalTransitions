function represent_dft(atividade, fs, txt, onlyHalf)
    f = linspace(-fs/2, fs/2, numel(atividade));
    
    if nargin > 3 && onlyHalf == true
        indices = find(f>=0);
        f = f(indices);
        atividade = atividade(indices);
    end
    plot(f, abs(atividade));
    title(txt);
end