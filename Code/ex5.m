load data_users
fs = 50;
eixo = 1;
user_exp = data{1}.data(:,eixo);
janela = 500; %mudar tamanho janelas 50 = 1s

step = 0.5*janela;
n_janelas = floor(length(user_exp)/step);
res = zeros(janela, n_janelas);


for i = 1:step:length(user_exp)-janela
    janela_gaussian = gausswin(janela).*detrend(user_exp(i:janela + i - 1));
    dft_janela = abs(fftshift(fft(janela_gaussian)));
    max_magnitude = max(dft_janela);
%     dft_janela = dft_janela./max_magnitude;
    res(:, ceil(i/step)) = dft_janela;
end

x_time = linspace(1, n_janelas*step/fs, n_janelas);
y_freq = linspace(-fs/2,fs/2, janela);
ix = y_freq > 0;
res = res(ix,:);
y_freq = y_freq(ix);
heatmap(x_time, y_freq, res);
colormap hot;



