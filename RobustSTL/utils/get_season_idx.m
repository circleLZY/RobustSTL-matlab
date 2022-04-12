function [season_idxs] = get_season_idx(total_len, target_idx, T, K, H)
    num_season = min(K, floor((target_idx-1)/T));
    if num_season < 1
        key_idxs = target_idx;
    else   
        key_idxs = target_idx + (1:num_season)*(-1*T);
    end
    season_idxs = [];
    for id = 1:length(key_idxs)
        season_idxs = [season_idxs, get_neighbor_range(total_len, key_idxs(id), H)];
    end
end

