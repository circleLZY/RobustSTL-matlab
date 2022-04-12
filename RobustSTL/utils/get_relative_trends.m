function [relative_trends] = get_relative_trends(delta_trends)
    relative_trends = cumsum(delta_trends);
end

