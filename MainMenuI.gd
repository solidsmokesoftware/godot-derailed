extends Node


func process(event):
	var value = 0
	if event.type == InputEvent.MOUSE_BUTTON:
		value = -2
	return value