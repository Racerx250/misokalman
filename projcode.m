if ~exist('my_table','var')
    my_table = readtable('Hospitalization_all_locs.csv');
end
location = 'California';
inputs = ["allbed_mean"; "deaths_mean"; "InvVen_mean"; "newICU_mean"; "total_tests"; "confirmed_infections"];
%inputs = ["total_tests"; "confirmed_infections"];
%output = 'confirmed_infections';

hold_len = 14;

root_dir = strcat('my_outputs_hold_', num2str(hold_len), '/');
mkdir(char(root_dir));

combo_list = nchoosek(1:length(inputs), 3);
for num = 1:length(inputs)
    errors = [];
    output = inputs(num);
    for filter_order = [5 10 20]
        %mkdir(char(strcat('my_outputs/', num2str(filter_order))));
        mkdir(char(strcat(root_dir, output, '/', num2str(filter_order))));
        my_errors = [];
        multiwiener_errors = [];
        for i = 1:size(combo_list, 1)
            combo = combo_list(i, :);
            combo_str = num2str(combo);
            combo_str = combo_str(find(~isspace(combo_str)));
            [my_error, weight_error, lpc_error, varma_error, multiwiener_error, ...
                my_trend_acc, multiwiener_trend_acc, weight_trend_acc, varma_trend_acc, ...
                lpc_trend_acc] = calc_filters(my_table, filter_order, location, inputs(combo), ...
                char(output), strcat(root_dir, output, '/', num2str(filter_order), '/', combo_str), hold_len);
            %errors = [errors; my_error, weight_error, lpc_error, varma_error];
            my_errors = [my_errors [my_error; my_trend_acc]];
            multiwiener_errors = [multiwiener_errors [multiwiener_error/100; multiwiener_trend_acc]];
        end
        if hold_len ~= 1
            errors = [errors; my_errors];
            continue
        end
        %size(varma_trend_acc)
        %size([varma_error; varma_trend_acc])
        %size(lpc_trend_acc)
        %size([lpc_error; lpc_trend_acc])
        errors = [errors; my_errors multiwiener_errors [weight_error; weight_trend_acc], ...
            [varma_error; varma_trend_acc], [lpc_error; lpc_trend_acc]];
        %print_m = [combo_list errors];
        %write_to_file(strcat('my_outputs/', num2str(filter_order), '/', output, '_errors.txt'), errors, '%d %d %d \n')
    end
    dlmwrite(strcat(root_dir, output, '_overall_errors.txt'), errors)
end
    
function [my_error, weight_error, lpc_error, varma_error, ...
    multiwiener_error, my_trend_acc, multiwiener_trend_acc, weight_trend_acc, varma_trend_acc, ...
    lpc_trend_acc] = calc_filters(my_table, filter_order, location, inputs, output, file_name, hold_len)
    ind = [];
    names = my_table{:, 'location_name'};
    for i = 1:size(names, 1)
        name = names(i);
        if strcmp(name{1}, location)
            ind = [ind i];
        end
    end
    
    width = filter_order;

    A = [0 1 0 0; 0 0 1 0; 0 0 0 1; .25 .25 .25 .25];
    B = [0; 0; 0; .5];
    C = [0 0 0 1];
    D = 0;

    measurement_noise_cov = 1;
    process_noise_cov = 1;

    my_filter = dsp.KalmanFilter('StateTransitionMatrix', A, 'ControlInputMatrix', B, ...
        'MeasurementMatrix', C, 'ProcessNoiseCovariance', process_noise_cov*eye(4), ...
        'MeasurementNoiseCovariance', measurement_noise_cov*eye(1), ...
        'InitialStateEstimate', zeros(4, 1), 'InitialErrorCovarianceEstimate', zeros(4), ...
        'ControlInputPort', false);

    kal_filter = dsp.KalmanFilter('StateTransitionMatrix', A, 'ControlInputMatrix', B, ...
        'MeasurementMatrix', C, 'ProcessNoiseCovariance', process_noise_cov*eye(4), ...
        'MeasurementNoiseCovariance', measurement_noise_cov*eye(1), ...
        'InitialStateEstimate', zeros(4, 1), 'InitialErrorCovarianceEstimate', zeros(4), ...
        'ControlInputPort', false);

    my_res = [];
    num_trials = size(ind, 2) - width;
    d_m = my_table{:, output};
    d_m(isnan(d_m)) = 0;
    d_m(isinf(d_m)) = 0;
    
    %temp_d = d_m(ind(1):ind(end));
    %ref_trend = diff(temp_d) >= 0;

    u_m = [];
    for j = 1:size(inputs, 1)
        input = inputs(j);
        temp = my_table{:, char(input)};
        temp(isnan(temp)) = 0;
        temp(isinf(temp)) = 0;
        u_m = [u_m temp];
    end

    for j = 1:floor(num_trials/hold_len)
        i = hold_len*j;
        
        u = [];
        for j = 1:size(inputs, 1)
            u = [u; u_m(ind(i):ind(i)+width-1, j)];
        end

        d = d_m(ind(i+width):ind(i+width) + hold_len - 1);
        %size(pinv(u))
        %size(d)
        x = d*pinv(u);
        
        temp_res = my_filter(x)*u;
        my_res = [my_res temp_res.'];
    end
    my_error = immse(my_res.', d_m(ind(1) + width:ind(length(my_res)) + width));
    my_trend_acc = mean((diff(my_res.') >= 0) == (diff(d_m(ind(1) + width:ind(length(my_res)) + width)) >= 0));
    
    multiwiener_res = [];
    for i = 1:num_trials
        u = [];
        for j = 1:size(inputs, 1)
            u = [u; u_m(ind(i):ind(i)+width-1, j)];
        end

        rr = xcorr(u);
        R = toeplitz(rr(ceil(length(rr)/2):end)) + 1e-64*eye(ceil(length(rr)/2));
        I = inv(R);
        
        d = d_m(ind(i+width));
        p = xcorr(d, u);
        w = I*p(ceil(length(p)/2):end);

        %size(p)
        %size(w)
        %size(u)
        
        multiwiener_res = [multiwiener_res w'*u];
    end

    multiwiener_error = immse(multiwiener_res.', d_m(ind(1) + width:ind(end)));
    multiwiener_trend_acc = mean((diff(multiwiener_res.') >= 0) == (diff(d_m(ind(1) + width:ind(end))) >= 0));

    
    weight_res = [];
    for i = 1:num_trials
        u = d_m(ind(i):ind(i)+width-1);
        d = d_m(ind(i) + width);
        x = pinv(u)*d;

        weight_res = [weight_res kal_filter(x)*u];
    end

    weight_error = immse(weight_res.', d_m(ind(1) + width:ind(end)));
    weight_trend_acc = mean((diff(weight_res.') >= 0) == (diff(d_m(ind(1) + width:ind(end))) >= 0));

    
    varma_1 = varm(1, width);
    est = estimate(varma_1,d_m(ind(1):ind(end)));
    varma_1_pred = filter(1, cell2mat(est.AR), d_m(ind(1):ind(end)));
    varma_error = immse(varma_1_pred, d_m(ind(1):ind(end)));

    varma_trend_acc = mean((diff(varma_1_pred) >= 0) == (diff(d_m(ind(1):ind(end))) >= 0));
    
    %plot(d_m(ind(1):ind(end)))
    nonzero_ind = find(d_m(ind(1):ind(end)) ~= 0);
    a = lpc(d_m(ind(nonzero_ind):ind(nonzero_ind) + 30),width);
    est_lpc = conv([0 -a(2:end)],d_m(ind(1):ind(end)));
    est_lpc = est_lpc(width+2:end - width + 1);
    lpc_error = immse(est_lpc, d_m(ind(1)+width:ind(end)));
    lpc_trend_acc = mean((diff(est_lpc) >= 0) == (diff(d_m(ind(1)+width:ind(end))) >= 0));

    write_to_file(strcat(file_name, '_d_n.txt'), d_m(ind(1) + width:ind(end)).', '%d\n')
    write_to_file(strcat(file_name, '_me.txt'), my_res.', '%d\n')
    %write_to_file('weight_res.txt', my_res.', '%d\n')
    write_to_file(strcat(file_name, '_lpc.txt'), est_lpc, '%d\n')
    write_to_file(strcat(file_name, '_varma.txt'), varma_1_pred, '%d\n')
    write_to_file(strcat(file_name, '_weight.txt'), weight_res, '%d\n')

    %hold on
    %plot(my_res)
    %figure
    %hold on
    %plot(d_m(ind(width)+1:ind(end)))
    %plot(multiwiener_res)
    %plot(weight_res)
    %plot(est_lpc(1:end))
end

function write_to_file(file_name, data, format)
    fid = fopen(file_name,'wt');
    % write the matrix
    if fid > 0
        fprintf(fid, format, data);
        fclose(fid);
    end
end
