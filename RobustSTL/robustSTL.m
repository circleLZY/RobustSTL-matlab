function [input, trends_hat, seasons_hat, remainders_hat] = robustSTL(input, season_len, reg1, reg2, K, H, dn1, dn2, ds1, ds2)
    [input, trends_hat, seasons_hat, remainders_hat] = robustSTL_(input, season_len, reg1, reg2, K, H, dn1, dn2, ds1, ds2);
end

