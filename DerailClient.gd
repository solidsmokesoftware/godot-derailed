extends Node

var client_name
var manager
var id

var verbose = true

func add_manager(name, handler):
	client_name = name
	manager = handler
	manager.add_client(self)
	

func process_input(sender, value):
	
	if verbose:
		print('Client %s-%s: Processed input %s from %s' % [client_name, id, value, sender])
	return
	
func process_output(value):
	
	if verbose:
		print('Client %s-%s: Processed output %s' % [client_name, id, value])
	return
	
func process_join(value):
	
	if verbose:
		print('Client %s-%s: Processed join %s' % [client_name, id, value])
	return
	
func process_part(value):
	
	if verbose:
		print('Client %s-%s: Processed join %s' % [client_name, id, value])
	return


func send(value):
	manager.process(id, value)
	
	if verbose:
		print('Client %s-%s: sent input %s' % [client_name, id, value])