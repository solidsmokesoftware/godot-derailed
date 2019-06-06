extends 'res://DerailClient.gd'

func _input(event):
	var value = 'none'
	if event.is_action_pressed('ui_up'):
		value = 'up'
	elif event.is_action_released('ui_down'):
		value = 'down'
	elif event.is_action_released('ui_left'):
		value = 'left'
	elif event.is_action_released('ui_right'):
		value = 'right'
	elif event.is_action_released('ui_select'):
		value = 'spacebar'
		
	if value != 'none':
		if verbose:
			print('Player: %s' % event) 
	
		send(value)