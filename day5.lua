-- dave

-- read input from terminal into array
local array = {}

local input = io.read()
while input do	
	array[#array + 1] = input
	input = io.read()
end

-- problem solution
local highest = 0
for i = 1, #array do
	local input = array[i]

	local row = tonumber(input:gsub("F", "0"):gsub("B", "1"):sub(1, -4), 2)
	local seat = tonumber(input:gsub("L", "0"):gsub("R", "1"):sub(-3), 2)

	local id = row * 8 + seat
	if id > highest then
		highest = id
	end
end

io.write(highest, "\n")

-- second problem solution
local taken = {}
local lowest = math.huge
local highest = 0
for i = 1, #array do
	local input = array[i]

	local row = tonumber(input:gsub("F", "0"):gsub("B", "1"):sub(1, -4), 2)
	local seat = tonumber(input:gsub("L", "0"):gsub("R", "1"):sub(-3), 2)

	local id = row * 8 + seat
	if id > highest then
		highest = id
	end
	if id < lowest then
		lowest = id
	end
	taken[id] = true
end

for id = lowest + 1, highest - 1 do
	if not taken[id] then
		io.write(id, "\n")
		return
	end
end