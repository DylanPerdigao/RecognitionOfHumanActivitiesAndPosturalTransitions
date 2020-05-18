%load data_users
fs = 50;
eixo = 3;
user = 1;
sobreposicao = 0.5;
user_exp = data{user}.data(:,eixo);
janela = 700; %mudar tamanho janelas 50 = 1s

step = sobreposicao*janela;
n_janelas = floor(length(user_exp)/step);
res = zeros(janela, n_janelas);


for i = 1:step:length(user_exp)-janela
    janela_gaussian = gausswin(janela).*detrend(user_exp(i:janela + i - 1));
    dft_janela = abs(fftshift(fft(janela_gaussian)));
    max_magnitude = max(dft_janela);
%     dft_janela = dft_janela./max_magnitude;
    res(:, ceil(i/step)) = dft_janela;
end

x_time = linspace(0, (n_janelas-1)*step/fs, n_janelas);
y_freq = linspace(-fs/2,fs/2, janela);
ix = y_freq > 0;
res = res(ix,:);
y_freq = y_freq(ix);
h = heatmap(x_time, y_freq, res);
show_y = zeros(length(y_freq),1);
for i = 1:length(y_freq)
   if rem(i, 10) == 0
      show_y(i) = 1; 
   end
end
show_y = boolean(show_y);
h.YDisplayLabels(~show_y) = {''};

xlabel("Tempo (s)");
ylabel("Frequência (Hz)");
colormap hot;
title(sprintf("STFT da experiência %d no eixo %c com %.1f%% de sobreposição e janela de tamanho %ds", user + 40, char('X'+eixo-1), sobreposicao*100, janela/fs));


