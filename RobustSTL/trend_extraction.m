function [sample_minus_trends, relative_trends] = trend_extraction(sample, season_len, reg1, reg2)
    sample_len = length(sample);
    season_diff = sample(season_len+1:end) - sample(1:end-season_len);
    q = [season_diff, zeros(1, sample_len*2-3)]';
    M = get_toeplitz(sample_len-season_len, sample_len-1, ones(1, season_len));
    D = get_toeplitz(sample_len-2, sample_len-1, [1,-1]);
    P = [M; reg1*eye(sample_len-1); reg2*D];
    f = [zeros(sample_len-1,1); ones(length(q),1)];
    A = [P, -eye(length(q)); -P, -eye(length(q))];
    b = [q;-q];
    [delta_trends,~] = linprog(f,A,b);
    delta_trends = [0; delta_trends(1:sample_len-1)]';
    relative_trends = get_relative_trends(delta_trends);
    sample_minus_trends = sample - relative_trends;
end

