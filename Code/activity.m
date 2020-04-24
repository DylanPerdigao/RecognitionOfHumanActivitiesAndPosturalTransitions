function data = activity(data)
    for i = 1:length(data)
        data{i}.y_text = strings(length(data{i}.data), 1);
    end
    
    for linha = 1:length(data)
        for i = 1 : length(data{linha}.y_text)
            if data{linha}.y(i) == 1
                data{linha}.y_text(i) = 'W';
            elseif data{linha}.y(i) == 2
                data{linha}.y_text(i) = 'W\_U';
            elseif data{linha}.y(i) == 3
                data{linha}.y_text(i) = 'W\_D';
            elseif data{linha}.y(i) == 4
                data{linha}.y_text(i) = 'SIT';
            elseif data{linha}.y(i) == 5
                data{linha}.y_text(i) = 'STAND';
            elseif data{linha}.y(i) == 6
                data{linha}.y_text(i) = 'LAY';
            elseif data{linha}.y(i) == 7
                data{linha}.y_text(i) = 'STAND\_SIT';
            elseif data{linha}.y(i) == 8
                data{linha}.y_text(i) = 'SIT\_STAND';
            elseif data{linha}.y(i) == 9
                data{linha}.y_text(i) = 'SIT\_LIE';
            elseif data{linha}.y(i) == 10
                data{linha}.y_text(i) = 'LIE\_SIT';
            elseif data{linha}.y(i) == 11
                data{linha}.y_text(i) = 'STAND\_LIE';
            elseif data{linha}.y(i) == 12
                data{linha}.y_text(i) = 'LIE\_STAND';
            else
                data{linha}.y_text(i) = '';
            end
        end
    end
end