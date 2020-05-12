function represent_grafica(user_data, param)
   f = figure('Name',strcat("Experiment n°",int2str(user_data.user-19)),'NumberTitle','off');
   f.Position = [100,100,1200,700]; % Ter uma figura mais larga
   
   if strcmp(param, 'data')
      toplot = user_data.data;
   elseif strcmp(param, 'dft')
       toplot = user_data.dft;
   elseif strcmp(param, 'subsequencia')
       toplot = user_data.subsequencia;
   else
       toplot = user_data.data;
   end
   
   % Tracar o grafico
   for i=1:3
       cnt = 0;
       subplot(3,1,i);
       hold on
       x = 1:length(toplot);
       x = x./50; %Frequencia de 50Hz
       
       last = 1;
       dt = detrend(toplot);
       for point = 2:length(toplot)
           if user_data.y(point) ~= user_data.y(point-1) || point == length(toplot)
                plot(x(last:point), toplot(last:point,i),'Color', defineColor(user_data, point-1));
                last = point+1;
           end 
       end
       
       xlabel('Time (s)');
       if i==1
           ylabel("ACC_X");
       elseif i==2
           ylabel("ACC_Y");
       else
           ylabel("ACC_Z");
       end
       for linha = 2:length(user_data.y)
           if user_data.y(linha) ~= user_data.y(linha-1) && user_data.y(linha) > 0
               a = axis;
               if rem(cnt, 2) == 0, y = a(4)-0.5; else, y = a(3)+0.5; end %Alternar a escrita nos graficos
               cnt = cnt + 1;
               text(linha/50, y, user_data.y_text(linha)); %Escreve nos graficos a atividade
           end
       end
   end
end