function [denoise_sample] = denoise_step(sample, H, dn1, dn2)
    denoise_sample = zeros(1, length(sample));
    for idx = 1:length(sample)
        [start_idx, end_idx] = get_neighbor_idx(length(sample), idx, H);
        idxs = start_idx:end_idx;
        weight_sample = sample(idxs);
        weights = zeros(1, length(idxs));
        for jd = 1:length(idxs)
            weights(jd) = bilateral_filter(idxs(jd), idx, sample(idxs(jd)), sample(idx), dn1, dn2);
        end
        denoise_sample(idx) = sum(weight_sample.*weights) / sum(weights);
    end
end

