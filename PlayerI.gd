extends Node

func process(event):
	var value = 0
	if event.is_action_pressed('ui_up'):
		value = 1
	elif event.is_action_released('ui_down'):
		value = 2
	elif event.is_action_released('ui_left'):
		value = 3
	elif event.is_action_released('ui_right'):
		value = 4
	elif event.is_action_released('ui_space'):
		value = 5
	print(value)
	return value
