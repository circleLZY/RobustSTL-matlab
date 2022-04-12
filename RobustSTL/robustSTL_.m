function [input, trends_hat, seasons_hat, remainders_hat] = robustSTL_(input, season_len, reg1, reg2, K, H, dn1, dn2, ds1, ds2)
% args:
% - reg1: first order regularization parameter for trend extraction
% - reg2: second order regularization parameter for trend extraction
% - K: number of past season samples in seasonaility extraction
% - H: number of neighborhood in seasonality extraction
% - dn1, dn2 : hyperparameter of bilateral filter in denoising step.
% - ds1, ds2 : hypterparameter of bilarteral filter in seasonality extraction step.
    sample = input;
    trial = 1;
    while true
        denoise_sample = denoise_step(sample, H, dn1, dn2);
        [detrend_sample, relative_trends] = trend_extraction(denoise_sample, season_len, reg1, reg2);
        seasons_tilda = seasonality_extraction(detrend_sample, season_len, K, H, ds1, ds2);
        [trends_hat, seasons_hat, remainders_hat] = adjustment(sample, relative_trends, seasons_tilda, season_len);
        if trial ~= 1      
            converge = check_converge_criteria(previous_remainders, remainders_hat);
            if converge
                break
            end
        end
        trial = trial + 1;
        disp(["[!]", trial, "iteration will strat"]);
        previous_remainders = remainders_hat;
        sample = trends_hat + seasons_hat + remainders_hat;
    end
end

