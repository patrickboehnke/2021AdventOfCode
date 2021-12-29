grid = zeros(Int, 100, 100)
vertical = 1
for line in eachline("Day9/inputpuzzle.txt")
    for j in 1:length(line)
        grid[vertical, j] = parse.(Int, line[j:j])
    end
    global vertical += 1
end

lowcount = 0
for i in 1:100
    for j in 1:100
        if i == 1
            if j == 1
                if grid[i, j] < grid[i+1, j] && grid[i, j] < grid[i, j+1]
                    global lowcount += 1 + grid[i, j]
                end
            elseif j < 100
                if grid[i, j] < grid[i+1, j] && grid[i, j] < grid[i, j+1] && grid[i, j] < grid[i, j-1]
                    global lowcount += 1 + grid[i, j]
                end
            else
                if grid[i, j] < grid[i+1, j] && grid[i, j] < grid[i, j-1]
                    global lowcount += 1 + grid[i, j]
                end
            end
        elseif i < 100
            if j == 1
                if grid[i, j] < grid[i+1, j] && grid[i, j] < grid[i, j+1] && grid[i, j] < grid[i-1, j]
                    global lowcount += 1 + grid[i, j]
                end
            elseif j < 100
                if grid[i, j] < grid[i+1, j] && grid[i, j] < grid[i, j+1] && grid[i, j] < grid[i, j-1] && grid[i, j] < grid[i-1, j]
                    global lowcount += 1 + grid[i, j]
                end
            else
                if grid[i, j] < grid[i+1, j] && grid[i, j] < grid[i, j-1] && grid[i, j] < grid[i-1, j]
                    global lowcount += 1 + grid[i, j]
                end
            end
        else
            if j == 1
                if grid[i, j] < grid[i-1, j] && grid[i, j] < grid[i, j+1]
                    global lowcount += 1 + grid[i, j]
                end
            elseif j < 100
                if grid[i, j] < grid[i-1, j] && grid[i, j] < grid[i, j+1] && grid[i, j] < grid[i, j-1]
                    global lowcount += 1 + grid[i, j]
                end
            else
                if grid[i, j] < grid[i-1, j] && grid[i, j] < grid[i, j-1]
                    global lowcount += 1 + grid[i, j]
                end
            end
        end
    end
end

println("Puzzle 1: ", lowcount)