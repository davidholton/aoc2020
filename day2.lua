-- dave

-- read input from terminal into array
local array = {}

local input = io.read()
while input do
	array[#array + 1] = input
	input = io.read()
end

-- problem solution
local valid = 0
for i = 1, #array do
	local input = array[i]
	local a, b, c, pass = input:match("(%d+)-(%d+) (%a): (%a+)")

	a, b = tonumber(a), tonumber(b)
	local _, count = pass:gsub(c, "")

	if count <= b and count >= a then
		valid = valid + 1
	end
end

io.write(valid, "\n")

-- second problem solution
local valid = 0
for i = 1, #array do
	local input = array[i]
	local a, b, c, pass = input:match("(%d+)-(%d+) (%a): (%a+)")

	a, b = tonumber(a), tonumber(b)
	local found = 0

	if pass:sub(a, a) == c then
		found = found + 1
	end
	if pass:sub(b, b) == c then
		found = found + 1
	end

	if found == 1 then
		valid = valid + 1
	end
end

io.write(valid, "\n")