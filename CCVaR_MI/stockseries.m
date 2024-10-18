classdef stockseries
    %Properties for a time series of return of stock prices such as
    %Descriptive statitics (for now...)
    
    properties
        mean
        std
        min
        med
        max
        assymetry
        kurtosis
    end
    
    methods
        function obj = stockseries(series)
                obj.mean = mean(series);
                obj.std = std(series);
                obj.min = min(series);
                obj.med = median(series);
                obj.max = max(series);
                obj.assymetry = skewness(series);
                obj.kurtosis = kurtosis(series);
        end
    end
end

