function [seasons] = generate_seasons(total_len, season_len, season_num, season_type, season_level)
    season = get_season(season_len, season_type, season_level);
    seasons = repmat(season, 1, season_num);
    seasons = seasons(1:total_len);
end
