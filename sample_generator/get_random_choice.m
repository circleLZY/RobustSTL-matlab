function [rand_num] = get_random_choice(total_length, num_choice)
    rand_num = randperm(total_length, num_choice);
end
