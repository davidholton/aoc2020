-- dave

-- read input from terminal into array
local array = {}

local input = io.read()
local width = #input
while input do
	array[#array + 1] = input
	input = io.read()
end

-- helper functions
local function at(x, y)
	x = ((x - 1) % width) + 1
	return array[y]:sub(x, x)
end

-- problem solution
local count = 0
local x, y = 1, 1
while true do
	x, y = x + 3, y + 1
	if at(x, y) == "#" then
		count = count + 1
	end

	if y == #array then
		break
	end
end

io.write(count, "\n")

-- second problem solution
local sets = {{1, 1}, {3, 1}, {5, 1}, {7, 1}, {1, 2}}
local product = 1

for _, pair in ipairs(sets) do
	local count = 0
	local x, y = 1, 1

	local exit = false
	while not exit do
		x, y = x + pair[1], y + pair[2]
		if at(x, y) == "#" then
			count = count + 1
		end

		if y == #array then
			exit = true
		end
	end

	product = product * count
end

io.write(product, "\n")