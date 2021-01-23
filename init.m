function data = init()
    if ~isfile('data_users.mat')  %1º vez, onde ainda nao temos o ficheiro data.mat
        data = importData();
        data = importLabels(data);
        data = activity(data);
        data = calculate_allDFTs(data);
        fs = 50;
        save data_users
    else
        load('data_users.mat','data'); 
    end
end