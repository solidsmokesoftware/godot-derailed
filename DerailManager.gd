extends Node

signal process_request
signal update_notification
signal join_notification
signal part_notification

var clients = []
var running = false

var verbose = true

func _init():
	return

func start():
	running = true	
	if verbose:
		print('Manager: started')
	
func add_client(client):
	client.connect('client_input', self, 'process')
	client.connect('client_output', self, 'update_clients')	
	client.add_manager(self)
	clients.append(client)
	
	emit_signal('join_notification', client.id)
	
	if verbose:
		print('Manager: Client %s add' % client.index)
	
func remove_client(index):
	clients[index].disconnect('client_input', self, 'process')
	clients[index].disconnect('client_output', self, 'update_clients')
	clients[index].remove_manager()
	clients.remove(index)
	
	emit_signal('part_notification', index)
	
	if verbose:
		print('Manager: Client %s add' % client.index)

func process(sender, value):
	emit_signal('process_request', sender, value)
	
	if verbose:
		print('Manager: requesting processing')
		
func update_clients(sender, value):
	emit_signal('update_notification', sender, value)
	
	if verbose:
		print('manager: updating clients')
		
		
		
