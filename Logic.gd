extends 'res://DerailClient.gd'

class Actor:
	var controller
	var location
	
	func _init(controller, x, y):
		self.controller = controller
		self.location = Vector2(x, y)

var actors = {}

func _init():
	client_name = 'Logic'

func process_input(sender, value):
	if verbose:
		print('Logic: Processing %s from %s' % [value, sender])
		
	if actors.has(sender):
		var x = 0
		var y = 0
		if value == 'up':
			y -= 10
		elif value == 'down':
			y += 10
		elif value == 'left':
			x -= 10
		elif value == 'right':
			x += 10
		actors[sender].location.x += x
		actors[sender].location.y += y
				
		if verbose:
			print('Logic: Actor %s is acting: %s' % [sender, value])
				
	else:
		actors[sender] = Actor.new(sender, 100, 100)
		
		if verbose:
			print('Logic: new actor %s' % actors)
	
	send_output(actors)