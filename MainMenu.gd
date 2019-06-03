extends Node

var flag = false

func start():
	return true

func process(value):
	if value == 1:
		flag = !flag
		
func output():
	return flag