user = 1;
atividade = 12;
eixo = 1;

represent_dft(data{user}.dfts{atividade,eixo}, fs, 'simple', true);
represent_dft(data{user}.dfts_hamming{atividade,eixo}, fs, 'hamming', true);
represent_dft(data{user}.dfts_hann{atividade,eixo}, fs, 'hann', true);
represent_dft(data{user}.dfts_blackman{atividade,eixo}, fs, 'blackman', true);
represent_dft(data{user}.dfts_gaussian{atividade,eixo}, fs, 'gaussian', true);
represent_dft(data{user}.dfts_rect{atividade,eixo}, fs, 'rectangular', true);
represent_dft(data{user}.dfts_triang{atividade,eixo}, fs, 'triangular', true);
