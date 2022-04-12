function [sample, trends, seasons, noise] = sample_generation(total_len, season_len, season_type, season_level, trend_type, trend_level, trend_change_num, anomaly_num, anomaly_type, anomaly_level, noise_mean, noise_std)
    season_num = floor(total_len/season_len)+1;
    seasons = generate_seasons(total_len, season_len, season_num, season_type, season_level);
    remainders = generate_remainders(total_len, noise_mean, noise_std);
    anomalies = generate_anomalies(total_len, anomaly_num, anomaly_type, anomaly_level);
    trends = generate_trends(total_len, trend_change_num, trend_type, trend_level);
    sample = trends + seasons + remainders + anomalies;
    noise = remainders + anomalies;

end