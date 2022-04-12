function [toeplitz_mat] = get_toeplitz(h, w, entry)
    num_entry = length(entry);
    if num_entry < 1
        toeplitz_mat = zeros(h, w);
    else
        col = [entry(1), zeros(1,h-1)];
        row = [entry, zeros(1, w-num_entry)];
        toeplitz_mat = toeplitz(col, row);
    end
end

