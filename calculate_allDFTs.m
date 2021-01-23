function data = calculate_allDFTs(data)
    for i = 1:10
        data{i} = DFT(data{i});
    end
end