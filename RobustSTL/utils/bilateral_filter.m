function [weight] = bilateral_filter(j, t, y_j, y_t, delta1, delta2)
    idx1 = -1.0 * (abs(j-t)^2.0) / (2.0*delta1^2);
    idx2 = -1.0 * (abs(y_j-y_t)^2.0) / (2.0*delta2^2);
    weight = exp(idx1) * exp(idx2);
end
    
    

