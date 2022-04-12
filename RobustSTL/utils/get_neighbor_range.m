function [neighbor_range] = get_neighbor_range(total_len, target_idx, H)
    [start_idx, end_idx] = get_neighbor_idx(total_len, target_idx, H);
    neighbor_range = start_idx : end_idx;
end


