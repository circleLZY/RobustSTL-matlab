function [isconverge] = check_converge_criteria(prev_remainders, remainders)
    diff = sqrt(mean((remainders-prev_remainders).^2));
    if diff < 1e-10
        isconverge = true;
    else
        isconverge = false;
    end
end

