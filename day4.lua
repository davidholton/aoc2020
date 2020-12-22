-- dave

-- read input from terminal into array
local array = {}
local fields = {
	["byr"] = function(x)
		x = tonumber(x) or -1
		return x >= 1920 and x <= 2002
	end,
	["iyr"] = function(x)
		x = tonumber(x) or -1
		return x >= 2010 and x <= 2020
	end,
	["eyr"] = function(x)
		x = tonumber(x) or -1
		return x >= 2020 and x <= 2030
	end,
	["hgt"] = function(x)
		local s = tonumber(x:sub(1, #x - 2)) or -1
		if x:sub(-2) == "cm" then
			return s >= 150 and s <= 193
		end
		return s >= 59 and s <= 76
	end,
	["hcl"] = function(x)
		return x:match("#" .. string.rep("[0-9a-z]", 6)) == x
	end,
	["ecl"] = function(x)
		local valid = false
		for _, c in ipairs({"amb", "blu", "brn", "gry", "grn", "hzl", "oth"}) do
			if c == x then
				valid = true
			end
		end
		return valid
	end,
	["pid"] = function(x)
		return x:match("%d%d%d%d%d%d%d%d%d") == x
	end,
}

local input = io.read()
while input do
	local str = ""
	repeat
		str = str .. input .. " "
		input = io.read()
	until input == "" or not input
	
	array[#array + 1] = str
end

-- problem solution
local count = 0
for i = 1, #array do
	local input = array[i]
	local valid = true

	for field, _ in pairs(fields) do
		if not input:find(field .. ":") then
			valid = false
		end
	end

	if valid then
		count = count + 1
	end
end

io.write(count, "\n")

-- second problem solution
local count = 0
for i = 1, #array do
	local input = array[i]
	local valid = true

	for field, validate in pairs(fields) do
		local i, j = input:find(field .. ":")
		if not i or not j then
			valid = false
		else
			local k, l = input:find("%S+", j + 1)
			if validate(input:sub(k, l)) ~= true then
				valid = false
			end
		end
	end
	if valid then
		count = count + 1
	end
end

io.write(count, "\n")