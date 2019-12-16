# given a number we need to return a value 
# which has the maximum length collatz sequence
dict = Dict{Int64, Int64}()

function count_collatz(n::Int64)
    # this function returns the length of the sequence till 
    # the appearance of 1
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

function find_max(n::Int64)
    # this function finds the maximum key
    len = zeros(Int64, n)
    for i in 1:n
        len[i] = count_collatz(i)
    end
    return findmax(len)
end    

tup = find_max(10^6)
println("maximum length of the sequence is $(tup[1]) and it occurs at $(tup[2])")