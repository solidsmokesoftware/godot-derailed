extends Node

var x
var y

func start():
	x = 50
	y  = 50
	return true

func process(value):
	if value == 1:
		x += 10
	elif value == 2:
		x -= 10
	elif value == 3:
		y += 10
	elif value == 4:
		y -= 10
		
func output():
	return [x, y]