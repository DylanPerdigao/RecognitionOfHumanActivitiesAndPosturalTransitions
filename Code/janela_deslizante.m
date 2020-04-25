function user_data = janela_deslizante(user_data, indice_user_data, tamanho_seq)
    for i = 1:3
        user_data.subsequencia(:,i) = user_data.dft(indice_user_data:indice_user_data + tamanho_seq,i);
    end
end