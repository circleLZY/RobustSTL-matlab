function [seasons_tilda] = seasonality_extraction(sample, season_len, K, H, ds1, ds2)
    sample_len = length(sample);
    seasons_tilda = zeros(1, sample_len);
    for idx = 1:sample_len
        idxs = get_season_idx(sample_len, idx, season_len, K, H);
        if isempty(idxs)
            seasons_tilda(idx) = sample(idx);
        end
        weight_sample = sample(idxs);
        weights = zeros(1, length(idxs));
        for jd = 1:length(idxs)
            weights(jd) = bilateral_filter(idxs(jd), idx, sample(idxs(jd)), sample(idx), ds1, ds2);
        end
        seasons_tilda(idx) = sum(weight_sample .* weights)/sum(weights);
    end
end

