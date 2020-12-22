-- dave

-- read input from terminal into array
local array = {}

local input = io.read()
while input do
	local str = ""
	repeat
		str = str .. input .. "\n"
		input = io.read()
	until input == "" or not input
	
	array[#array + 1] = str
end

-- problem solution
local total = 0
for i = 1, #array do
	local input = array[i]
	
	local count = 0
	for c = 1, 26 do
		if input:find(("").char(c + 96)) then
			count = count + 1
		end
	end

	total = total + count
end

io.write(total, "\n")
-- second problem solution
local total = 0
for i = 1, #array do
	local input = array[i]
	local count = 0

	local party = {}
	for person in input:gmatch('[^,%s]+') do
		party[#party + 1] = person
	end

	for c = 1, 26 do
		local valid = true
		for _, person in ipairs(party) do
			if not person:find(("").char(c + 96)) then
				valid = false
			end
		end

		if valid then
			count = count + 1
		end
	end

	total = total + count
end

io.write(total, "\n")