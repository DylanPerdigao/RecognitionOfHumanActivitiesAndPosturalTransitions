function data = init()
    if ~isfile('data.mat')  %1� vez, onde ainda nao temos o ficheiro data.mat
        data = importData();
        data = importLabels(data);
        data = activity(data);
        save data
    else
        load('data.mat','data'); 
    end
end