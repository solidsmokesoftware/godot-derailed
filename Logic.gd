extends Node

class Actor:
	var owner
	var x
	var y
	
	func _init(owner, x, y):
		self.owner = owner
		self.x = x
		self.y = y

var actors = []

func start():
	actors = []
	return true

func process(sender, value):
	if value == 'spacebar':
		actors.append(Actor.new(sender, 100, 100))
	else:
		for actor in actors:
			if actor.owner == sender:
				if value == 'up':
					actor.y += 10
				elif value == 'down':
					actor.y -= 10
				elif value == 'left':
					actor.x -= 10
				elif value == 'right':
					actor.x += 10
					
		
func output():
	return actors