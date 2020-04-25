%%  MINI_PROJETO ATD 2020
%%====================================
%.....................................
clc
close all;
data = init();
fs = 50;
%represent_grafica(data{2}, 'data');
freq = zeros(10,3);
for i = 1:10
    data{i} = DFT(data{i});
    for eixo = 1:3
        freq(i, eixo) = find_prevalent_frequency(data{i}.dfts{1,eixo}, fs);
    end
end

m = mean(freq);
v = std(freq);
passos_per_min = 60*m(1);

% atividade 1 no eixo X sem janela 
%represent_dft(data{2}.dfts{1,1}, fs);
% represent_dft(data{2}.dfts_hamming{1,1}, fs);
% represent_dft(data{2}.dfts_hann{1,1}, fs);
% represent_dft(data{2}.dfts_blackman{1,1}, fs);
% represent_dft(data{2}.dfts_gaussian{1,1}, fs);
% close all


% data{2} = janela_deslizante(data{2}, 2, 100);

