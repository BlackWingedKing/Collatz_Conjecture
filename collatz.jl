function collatz(n::Int64, arr::Array{Int64,1})
    if (n == 1)
        push!(arr,1)
        return arr
    elseif (n%2 == 0)
        push!(arr, n)
        collatz(convert(Int64, n/2), arr)
    else
        push!(arr, n)
        collatz(3n+1, arr)
    end
end

n = 1000000000
x = Int64[]
seq = collatz(n,x)
for i in seq
    println(i)
end