function [trends_hat, seasons_hat, remainders_hat] = adjustment(sample, relative_trends, seasons_tilda, season_len)
    num_season = floor(length(sample)/season_len);
    trend_init = mean(seasons_tilda(1:season_len*num_season));
    trends_hat = relative_trends + trend_init;
    seasons_hat = seasons_tilda - trend_init;
    remainders_hat = sample - trends_hat - seasons_hat;
    
end

