using CSV
using DataFrames
using StringEncodings
using Dates
using Statistics

datetime_format = dateformat"d.m.y H:M:S.s";

date_column = "Date"
time_column = "Time"
power_column = "Rychlost nabíjení [W]"
memory_column = "Použitá fyzická paměť [MB]"

function filter_floats(date_vals, time_vals, power_vals, memory_vals)
    filtered_date = Vector{typeof(date_vals[1])}()
    filtered_time = Vector{typeof(time_vals[1])}()
    filtered_power = Vector{Float64}()
    filtered_memory = Vector{Int32}()
    
    for i in 1:length(power_vals)
        power_val = power_vals[i]
        try
            float_power_val = parse(Float64, string(power_val))
            int_memory_val = parse(Int32, string(memory_vals[i]))
            push!(filtered_date, date_vals[i])
            push!(filtered_time, time_vals[i])
            push!(filtered_power, float_power_val)
            push!(filtered_memory, int_memory_val)
        catch e
            if isa(e, ArgumentError) || isa(e, MethodError)
                continue
            else
                rethrow(e)
            end
        end
    end
    return filtered_date, filtered_time, filtered_power, filtered_memory
end

function calculate_time_differences(datetimes::Vector{DateTime})
    n = length(datetimes)
    time_diffs = zeros(Float64, n)
    time_diffs[1] = 0.0  # First element will have time diff as zero

    for i in 2:n
        diff = datetimes[i] - datetimes[i-1]
        time_diffs[i] = (Dates.value(diff) / 1000.0)  # Convert to seconds
    end

    return time_diffs
end

open(ARGS[1], enc"WINDOWS-1250") do io
    df = CSV.File(io, select=[date_column, time_column, power_column, memory_column]) |> DataFrame
#    first_col_name = names(df)[2]
#    col_names = names(df)
#    for (index, name) in enumerate(col_names)
#        println("$(index). $name")
#    end
    date_vals = df[!, date_column]
    time_vals = df[!, time_column]
    power_vals = df[!, power_column]
    memory_vals = df[!, memory_column]
    
    filtered_date, filtered_time, filtered_power, filtered_memory = filter_floats(date_vals, time_vals, power_vals, memory_vals)

    datetime_strings = ["$(filtered_date[i]) $(filtered_time[i])" for i in 1:length(filtered_date)]
    datetimes = [DateTime(dt_str, datetime_format) for dt_str in datetime_strings]
    
    time_diffs = calculate_time_differences(datetimes)
    
#    for i in 1:length(filtered_time)
#        println("$(datetimes[i]) - $(filtered_power[i]) - Time Diff: $(time_diffs[i]) - $(filtered_memory[i])")
#    end
    
    total_sum = 0.0
    for i in 1:length(filtered_power)
        total_sum += abs(filtered_power[i]) * time_diffs[i]/3600
    end

    total_time = Dates.value(last(datetimes) - datetimes[1])/1000.0/3600.0
    hourly_power = total_sum/total_time;

    print("Start time: $(datetimes[1])\nEnd time: $(last(datetimes))\n")
    print("Total power: $total_sum\nHourly power: $hourly_power\n")
    print("Memory maximum: $(maximum(filtered_memory))\nMemory average: $(mean(filtered_memory))\n")
end
