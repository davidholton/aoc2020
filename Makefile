lua=./lua
day=1

all:
	$(lua) day$(day).lua < input/day$(day).txt
