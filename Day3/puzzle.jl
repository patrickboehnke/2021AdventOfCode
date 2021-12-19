using DataFrames
using CSV

df = DataFrame(CSV.File("./Day3/inputpuzzle.csv", types=String))
mostcommon = zeros(12)
for i in 1:12
    for j in 1:size(df, 1)
        if parse(Int, df[j, :Power][i]) == 1
            mostcommon[i] = mostcommon[i] + 1
        end
    end 
end

global gamma = ""
global epsilon = ""

for i in 1:12
    if mostcommon[i] > size(df, 1)/2
        global gamma = gamma*"1"
        global epsilon = epsilon*"0"
    else
        global gamma = gamma*"0"
        global epsilon = epsilon*"1"
    end
end
println(gamma)
println(epsilon)

print("Puzzle 1 Answer: ")
println(parse(Int, gamma; base=2)*parse(Int, epsilon; base=2))

mostcommon = zeros(12)
for i in 1:12
    for j in 1:size(df, 1)
        if parse(Int, df[j, :Power][i]) == 1
            mostcommon[i] = mostcommon[i] + 1
        end
    end
    if mostcommon[i] >= size(df, 1)/2
        global df = filter(:Power => power -> parse(Int, power[i]) == 1, df)
    else
        global df = filter(:Power => power -> parse(Int, power[i]) == 0, df)
    end
    if size(df, 1) == 1
        global oxygen = (df[1, :Power])
        break
    end
end
df = DataFrame(CSV.File("./Day3/inputpuzzle.csv", types=String))


mostcommon = zeros(12)
for i in 1:12
    for j in 1:size(df, 1)
        if parse(Int, df[j, :Power][i]) == 1
            mostcommon[i] = mostcommon[i] + 1
        end
    end
    if mostcommon[i] < size(df, 1)/2
        global df = filter(:Power => power -> parse(Int, power[i]) == 1, df)
    else
        global df = filter(:Power => power -> parse(Int, power[i]) == 0, df)
    end
    if size(df, 1) == 1
        global co2 = (df[1, :Power])
        break
    end
end

print("Puzzle 2 Answer: ")
println(parse(Int, oxygen; base=2)*parse(Int, co2; base=2))
