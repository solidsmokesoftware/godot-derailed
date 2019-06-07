extends Node2D

onready var manager = get_node('Derail')

onready var logic = get_node('Logic')
onready var view = get_node('View')
onready var player = get_node('Player')

func _ready():
	start()
	
func start():
	manager.process_input('prep', 'system')
	manager.get_clients()
	