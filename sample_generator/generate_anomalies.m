function [anomalies] = generate_anomalies(total_len, anomaly_num, anomaly_type, anomaly_level)
    anomaly_time_steps = get_random_choice(total_len, anomaly_num);
    anomalies = zeros(1, total_len);
    for id = 1:length(anomaly_time_steps)
        anomalies(anomaly_time_steps(id)) = anomalies(anomaly_time_steps(id)) + get_change(anomaly_type, anomaly_level);
    end
end

