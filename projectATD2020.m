%%  MINI_PROJETO ATD 2020
%%====================================
%.....................................
%%  LEITURA DOS FICHEIROS
%.....................................
PATH = "data_pl5/";
files = dir(PATH);
numberOfFiles = length(files)-2;
% O data vai ter uma coluna para cada ficherio
data = cell(1,numberOfFiles);

for k = 3:length(files)
	file = files(k).name;
    % Cada coluna do data contem os dados do ficheiro
    data{k-2}=double(importdata(strcat(PATH,file)));
end
%.....................................
%%  Representacao Grafica dos Dados
%.....................................
for k=1:numberOfFiles
   f = figure(k);
   % Ter uma figura mais larga
   f.Position = [100,100,1200,500];
   % Tracar o grafico
   for i=1:3
       subplot(3,1,i)
       plot(data{1,k}(:,i))
       xlabel('Time (min)');
       if i==1
           ylabel(strcat("ACC_X"));
       elseif i==2
           ylabel(strcat("ACC_Y"));
       else
           ylabel(strcat("ACC_Z"));
       end
   end
   % Escrever no grafico
   txt = 'OLA';
   text(0,2,txt);
end