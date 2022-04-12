function [remainders] = generate_remainders(total_len, noise_mean, noise_std)
    remainders = normrnd(noise_mean, noise_std, [1, total_len]);
end

