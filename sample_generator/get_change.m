function [change_num] = get_change(change_type, change_level)
    if change_type == "random"
        change_num = (round(rand)*2-1) * change_level;
    elseif change_type == "spike" || change_type == "increase"
        change_num = change_level;
    elseif change_type == "dip" || change_type == "decrease"
        change_num = -1 * change_level;
    end
end

