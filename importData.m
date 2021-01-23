function data = importData()
    PATH = "data_pl5/";
    files = dir(PATH);
    numberOfFiles = length(files)-2;
    % O data vai ter uma coluna para cada ficheiro
    data = cell(1,numberOfFiles);
    % Comecar em 3 para ignorar os ficheiros "." e ".."
    for k = 3:length(files)
        file = files(k).name;
        % Cada coluna do data contem uma estrutura com os dados do ficheiro
        data{k-2}.data = double(importdata(strcat(PATH,file)));
        data{k-2}.exp = k+38; %guarda nº da experiencia
        data{k-2}.user = k+17; %guarda nº user
    end 