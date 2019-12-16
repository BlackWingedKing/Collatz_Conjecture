# given a number we need to return a value 
# which has the maximum length collatz sequence
include("collatz.jl")

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