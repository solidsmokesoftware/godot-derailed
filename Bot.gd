extends 'res://DerailClient.gd'

var actions = ['up', 'down', 'left', 'right', 'spacebar']
var timer

func _init():
	client_name = 'Bot'

func _ready():
	
	timer = Timer.new()
	add_child(timer)
	timer.connect("timeout",self,"random_action")
	timer.start()
	
func random_action():
	var r = randi() % 4
	send_input(actions[r])
	
	if verbose:
		print('Bot: random action %s sent' % actions[r])