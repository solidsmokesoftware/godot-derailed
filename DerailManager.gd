extends Node

var clients = []

var verbose = true

func _ready():
	add_to_group('manager')
	return

func get_clients():
	var ids = 0
	clients = get_tree().get_nodes_in_group("clients")
	for client in clients:
		client.id = ids
		ids += 1 
	

func process_input(sender, value):
	for client in clients:
		client.process_input(sender, value)
		
	if verbose:
		print('Manager: Processed input %s from %s' % [value, sender])

func process_output(sender, value):
	for client in clients:
		client.process_output(sender, value)
		
	if verbose:
		print('Manager: Processed output %s from %s' % [str(value), sender])


