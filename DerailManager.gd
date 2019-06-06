extends Node

var clients = []
var running = false

var output = []

var verbose = true

func _init():
	return

func start():
	running = true	
	if verbose:
		print('Manager: started')

func add_client(client):
	var id = clients.size()
	client.id = id
	clients.append(client)
	
	for client in clients:
		client.process_join(id)
	
	if verbose:
		print('Manager: Client %s joined id %s' % [client.client_name, client.id])
	
func remove_client(index):
	clients[index].manager = null
	clients[index].id = null
	clients.remove(index)
	
	for client  in clients:
		client.process_part(index)
		
	if verbose:
		print('Manager: Client %s was removed' % index)

func process(sender, value):
	output = []
	for client in clients:
		output.append(client.process_input(sender, value))
		
	if verbose:
		print('Manager: Processed input %s from %s' % [sender, value])
	
	for client in clients:
		client.process_output(output)
		
	if verbose:
		print('Manager: Processed output %s' % str(output))


