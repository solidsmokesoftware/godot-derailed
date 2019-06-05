extends 'res://DerailClient.gd'

var actions = ['up', 'down', 'left', 'right', 'spacebar']
var timer

func _init():
	timer = Timer.new()
	timer.connect("timeout",self,"random_action")
	timer.start()
	
func random_action():
	var r = randi() % 4
	send([actions[r]])