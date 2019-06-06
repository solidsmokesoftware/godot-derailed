extends 'res://DerailClient.gd'

var actions = ['up', 'down', 'left', 'right', 'spacebar']
var timer

func _ready():
	
	timer = Timer.new()
	timer.connect("timeout",self,"random_action")
	timer.start()
	
func random_action():
	var r = randi() % 4
	send([actions[r]])
	
	if verbose:
		print('Bot: random action %s sent' % actions[r])