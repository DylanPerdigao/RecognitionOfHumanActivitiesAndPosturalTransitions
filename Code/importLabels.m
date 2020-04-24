function data = importLabels(data)
    PATH = "data_labels/labels.txt";
    labels_data = double(importdata(PATH));
    for i = 1:length(data)
        data{i}.y = zeros(length(data{i}.data), 1);
    end
    
    for linha = 1:length(labels_data)
        if labels_data(linha, 1) > 40 && labels_data(linha, 1) <= 50
            for i = labels_data(linha, 4):labels_data(linha, 5)
                data{labels_data(linha, 1)-40}.y(i) = labels_data(linha, 3);
            end
        end
    end
end