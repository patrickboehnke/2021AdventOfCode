using DataFrames
using CSV

df = DataFrame(CSV.File("./Day2/inputpuzzle.csv"))

global forward = 0
global depth = 0
for i in 1:size(df,1)
    if df[i, :Direction] == "forward"
        global forward += df[i, :Amount]
    elseif df[i, :Direction] == "up"
        global depth -= df[i, :Amount]
    elseif df[i, :Direction] == "down"
        global depth += df[i, :Amount]
    end
end

print("Puzzle 1 Answer: ")
println(forward*depth)

global forward = 0
global depth = 0
global aim = 0
for i in 1:size(df,1)
    if df[i, :Direction] == "forward"
        global forward += df[i, :Amount]
        global depth += aim * df[i, :Amount]
    elseif df[i, :Direction] == "up"
        global aim -= df[i, :Amount]
    elseif df[i, :Direction] == "down"
        global aim += df[i, :Amount]
    end
end

print("Puzzle 2 Answer: ")
println(forward*depth)