function color = defineColor(user_data, i) %Atribuir cores as diferentes atividades
    colors = ['DAA520'; '00FF00'; '0000FF'; '00FFFF'; 'FF00FF'; 'FFFF00';  'FF0000';'4682B4'; '228B22'; 'A3B221';'3421FF'; 'FA22FA'];
    if user_data.y(i) > 0
        color = colors(user_data.y(i),:);
    else
        color = 'A9A9A9';
    end
    color = sscanf(color,'%2x%2x%2x',[1 3])/255;
end