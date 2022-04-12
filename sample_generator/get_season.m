function [season] = get_season(season_len, season_type, season_level)
    season = zeros(1, season_len);
    if season_type == "random"
        season = 2*(randperm(season_len,1)-0.5) * season_level;
    elseif season_type == "stair"
        half_idx = floor(season_len/2);
        season(1:half_idx) = season(1:half_idx) + season_level;
        season(half_idx+1:end) = season(half_idx+1:end) - season_level;
    end
end
