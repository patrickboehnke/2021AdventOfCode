using DataFrames
using CSV

df = DataFrame(CSV.File("./Day1/inputpuzzle1.csv"))

global counter = 0
for i in 2:size(df,1)
    if df[i, :Depth] > df[i-1, :Depth]
        global counter += 1
    end
end

print("Puzzle 1 Answer: ")
println(counter)

global counter = 0
for i in 2:size(df,1)-2
    if df[i, :Depth] + df[i+1, :Depth] + df[i+2, :Depth] > df[i-1, :Depth] + df[i, :Depth] + df[i+1, :Depth]
        global counter += 1
    end
end

print("Puzzle 2 Answer: ")
println(counter)