using DataFrames
using CSV


turnnumbers = [79,9,13,43,53,51,40,47,56,27,0,14,33,60,61,36,72,48,83,42,10,86,41,75,16,80,15,93,95,45,68,96,84,11,85,63,18,31,35,74,71,91,39,88,55,6,21,12,58,29,69,37,44,98,89,78,17,64,59,76,54,30,65,82,28,50,32,77,66,24,1,70,92,23,8,49,38,73,94,26,22,34,97,25,87,19,57,7,2,3,46,67,90,62,20,5,52,99,81,4]
df = DataFrame(CSV.File("./Day4/inputpuzzle.csv", types=String, ignoreemptyrows=true, header=0))

bingogrids = Array{Int16}(undef, 100, 5, 5)

for i in 1:size(df, 1)
    for j in 1:5
        bingogrids[fld(i -1, 5)+1, i - fld(i-1,5)*5, j] = parse(Int, df[i, :Column1][(j-1)*3+1:j*3-1])
    end
end

resultfound = 0
for turn in turnnumbers
    for i in 1:100
        for j in 1:5
            for k in 1:5
                if bingogrids[i, j, k] == turn
                    bingogrids[i, j, k] = -100
                end
            end
        end
        temp = bingogrids[i, :, :]
        if minimum(sum(temp, dims=1)) == -500 || minimum(sum(temp, dims=2)) == -500
            println("Bingo ", turn)
            global sumgrid = 0
            global finalturn = turn
            for i in 1:5
                for j in 1:5
                    if temp[i, j] > -1
                        global sumgrid += temp[i, j]
                    end
                end
            end

            global resultfound = 1
            break
        end
    end

    if resultfound == 1
        break
    end
end

println("Puzzle 1 Answer: ", sumgrid*finalturn)

bingogrids = Array{Int16}(undef, 100, 5, 5)
winninggames = zeros(100)
for i in 1:size(df, 1)
    for j in 1:5
        bingogrids[fld(i -1, 5)+1, i - fld(i-1,5)*5, j] = parse(Int, df[i, :Column1][(j-1)*3+1:j*3-1])
    end
end
resultfound = 0
for turn in turnnumbers
    for i in 1:100
        for j in 1:5
            for k in 1:5
                if bingogrids[i, j, k] == turn
                    bingogrids[i, j, k] = -100
                end
            end
        end
        temp = bingogrids[i, :, :]
        if minimum(sum(temp, dims=1)) == -500 || minimum(sum(temp, dims=2)) == -500
            winninggames[i] = 1
            if sum(winninggames) == 100
                global sumgrid = 0
                global finalturn = turn
                for k in 1:5
                    for j in 1:5
                        if temp[k, j] > -1
                            global sumgrid += temp[k, j]
                        end
                    end
                end
                global resultfound = 1
                break
            end

            
        end
    end

    if resultfound == 1
        break
    end
end

println("Puzzle 2 Answer: ", sumgrid*finalturn)
