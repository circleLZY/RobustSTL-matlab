function [start_idx, end_idx] = get_neighbor_idx(total_len, target_idx, H)
    start_idx = max(1, target_idx-H);
    end_idx = min(total_len, target_idx+H);
end
