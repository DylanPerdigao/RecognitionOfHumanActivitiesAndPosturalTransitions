function represent_grafica(user_data)
   f = figure('Name',strcat("Experiment n°",int2str(user_data.user-19)),'NumberTitle','off');
   % Ter uma figura mais larga
   f.Position = [100,100,1200,700];
   % Tracar o grafico
  
   for i=1:3
       cnt = 0;
       subplot(3,1,i)
        hold on
       x = 1:length(user_data.data);
       x = x./50;
       
       %plot(x, user_data.data(:,i), defineColor(user_data));
       last = 1;
       for point = 2:length(user_data.data)
           if user_data.y(point) ~= user_data.y(point-1) || point == length(user_data.data)
                plot(x(last:point), user_data.data(last:point,i),'Color', defineColor(user_data, point-1));
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
               if rem(cnt, 2) == 0, y = a(4)/2; else, y = a(3)/2; end
               cnt = cnt + 1;
               text(linha/50, y, user_data.y_text(linha));
           else
               
           end
       end
   end
   
   
end