using DataFrames
using CSV


df = DataFrame(CSV.File("./Day5/inputpuzzle.csv", types=String, ignoreemptyrows=true, header=0))
df2 = DataFrame([(a=a,b=b) for (a,b) in split.(df.Column2, "->")])

df[:, :x1] = parse.(Int, df[!,:Column1])
df[:, :y1] = parse.(Int, df2[:, :a])
df[:, :x2] = parse.(Int, df2[:, :b])
df[:, :y2] = parse.(Int, df[!,:Column3])

gridsize = maximum([maximum(df[:, :x1]), maximum(df[:, :x2]), maximum(df[:, :y1]), maximum(df[:, :y2])])
grid = zeros(gridsize, gridsize)

for i in 1:size(df, 1)
    if df[i, :x1] == df[i, :x2]
        start = minimum([df[i, :y1], df[i, :y2]])
        finish = maximum([df[i, :y1], df[i, :y2]])
        for j in start:finish
            grid[df[i, :x1], j] += 1
        end
    elseif df[i, :y1] == df[i, :y2]
        start = minimum([df[i, :x1], df[i, :x2]])
        finish = maximum([df[i, :x1], df[i, :x2]])
        for j in start:finish
            grid[j, df[i, :y1]] += 1
        end
    end
end

global counter = 0
for i in 1:gridsize
    for j in 1:gridsize
        if grid[i, j] > 1
            global counter += 1
        end
    end
end

println("Puzzle 1: ", counter)

grid = zeros(gridsize, gridsize)

for i in 1:size(df, 1)
    if df[i, :x1] == df[i, :x2]
        start = minimum([df[i, :y1], df[i, :y2]])
        finish = maximum([df[i, :y1], df[i, :y2]])
        for j in start:finish
            grid[df[i, :x1], j] += 1
        end
    elseif df[i, :y1] == df[i, :y2]
        start = minimum([df[i, :x1], df[i, :x2]])
        finish = maximum([df[i, :x1], df[i, :x2]])
        for j in start:finish
            grid[j, df[i, :y1]] += 1
        end
    else
        d = maximum([df[i, :x1], df[i, :x2]]) - minimum([df[i, :x1], df[i, :x2]])
        sx = sign(df[i, :x2] - df[i, :x1])
        sy = sign(df[i, :y2] - df[i, :y1])
        for j in 0:d
            grid[df[i, :x1]+j*sx, df[i, :y1]+j*sy] += 1
        end
    end
end

global counter = 0
for i in 1:gridsize
    for j in 1:gridsize
        if grid[i, j] > 1
            global counter += 1
        end
    end
end

println("Puzzle 2: ", counter)