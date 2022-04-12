function [trends] = generate_trends(total_len, trend_change_num, trend_type, trend_level)
    trends = zeros([1, total_len]);
    change_points = get_random_choice(total_len, trend_change_num);
    for idx = 1:length(change_points)
        change_value = get_change(trend_type, trend_level);
        trends(change_points(idx):end) = trends(change_points(idx):end) + change_value;
    end
end