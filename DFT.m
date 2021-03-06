function user_data = DFT(user_data)
    %return cell(12,3) onde linhas s�o a atividade e colunas o eixo
    % cada elemento da cell � uma matriz cujas colunas s�o as diversas dfts
    % para cada atividade
    user_data.dfts = cell(12, 3);
    user_data.dfts_hamming = cell(12, 3);
    user_data.dfts_hann = cell(12,3);
    user_data.dfts_blackman = cell(12,3);
    user_data.dfts_gaussian = cell(12,3);
    user_data.dfts_rect = cell(12,3);
    user_data.dfts_triang = cell(12,3);
    for eixo = 1:3
        for at = 1:12
            indices = user_data.y == at;
            %activity data
            atividade = detrend(user_data.data(indices,eixo));
            %simple dft
            user_data.dfts{at, eixo} = fftshift(fft(atividade));
            %hamming
            janela_hamming = hamming(numel(atividade)).*atividade;
            user_data.dfts_hamming{at, eixo} = fftshift(fft(janela_hamming));
            %hann
            janela_hann = hann(numel(atividade)).*atividade;
            user_data.dfts_hann{at, eixo} = fftshift(fft(janela_hann));
            %blackman
            janela_blackman = blackman(numel(atividade)).*atividade;
            user_data.dfts_blackman{at, eixo} = fftshift(fft(janela_blackman));
            %gaussian
            janela_gaussian = gausswin(numel(atividade)).*atividade;
            user_data.dfts_gaussian{at, eixo} = fftshift(fft(janela_gaussian));
            %rectangular
            janela_rect = rectwin(numel(atividade)).*atividade;
            user_data.dfts_rect{at, eixo} = fftshift(fft(janela_rect));
            %triangular
            janela_triang = triang(numel(atividade)).*atividade;
            user_data.dfts_triang{at, eixo} = fftshift(fft(janela_triang));
        end
    end    
end
