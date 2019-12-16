function collatz(n::Int64, arr::Array{Int64,1})
# this function for a given n > 0 returns the sequence
# note only for postive integers
    if (n == 1)
        push!(arr,1)
        return arr
    elseif (n%2 == 0)
        push!(arr, n)
        collatz(div(n,2), arr)
    else
        push!(arr, n)
        collatz(3n+1, arr)
    end
end

dict = Dict{Int64, Int64}()

function count_collatz(n::Int64)
    if (haskey(dict, n))
        return dict[n]
    elseif (n ==1)
        dict[1] = 1
        return 1
    elseif (n%2 == 0)
        dict[n] = count_collatz(div(n,2)) + 1
        return dict[n]
    else
        dict[n] = count_collatz(3n+1) + 1
        return dict[n]
    end
end

n = 10000
x = Int64[]
seq = collatz(n,x)
println(count_collatz(n))
println(size(seq))