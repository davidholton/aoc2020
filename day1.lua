-- dave

-- read input from terminal into array
local array = {}

local input = io.read()
while input do
	array[#array + 1] = input
	input = io.read()
end

-- problem solution
for i = 1, #array - 1 do
	for j = i + 1, #array do
		if array[i] + array[j] == 2020 then
			io.write(array[i] * array[j], "\n")
			break
		end
	end
end

-- second problem solution
for i = 1, #array - 2 do
	for j = i + 1, #array - 1 do
		for k = j + 1, #array do
			if array[i] + array[j] + array[k] == 2020 then
				io.write(array[i] * array[j] * array[k], "\n")
				break
			end
		end
	end
end