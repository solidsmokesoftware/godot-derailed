extends Node

var client_name
var manager
var id

var verbose = true

func _ready():
	add_to_group('clients')
	get_manager()

func get_manager():
	manager = get_tree().get_nodes_in_group("manager")[0]
	

func process_input(sender, value):
	
	if verbose:
		print('Client %s-%s: Processed input %s from %s' % [client_name, id, value, sender])
	return
	
func process_output(sender, value):
	
	if verbose:
		print('Client %s-%s: Processed output %s from %s' % [client_name, id, value, sender])
	return

func send_input(value):
	manager.process_input(id, value)
	
	if verbose:
		print('Client %s-%s: sent input %s' % [client_name, id, value])
	return
		
func send_output(value):
	manager.process_output(id, value)
	
	if verbose:
		print('Client %s-%s: sent output %s' % [client_name, id, value])
	return	