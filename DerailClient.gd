extends Node

signal client_input
signal client_output

var manager
var id = -1

var verbose = true

func add_manager(manager):
	self.id = manager.clients.size() + 1
	self.manager = manager
	manager.connect('process_request', self, 'process')
	manager.connect('update_notification', self, 'update')
	manager.connect('join_notification', self, 'client_joined')
	manager.connect('part_notification', self, 'client_parted')

	if verbose:
		print('Client %s: joined manager' % id)
		
func remove_manager():
	var old_id = id
	id = -1
	manager.disconnect('process_request', self, 'process')
	manager.disconnect('update_notification', self, 'update')
	manager.disconnect('join_notification', self, 'client_joined')
	manager.disconnect('part_notification', self, 'client_parted')
	manager = null

	if verbose:
		print('Client %s: parted manager' % old_id)


func send_input(value):
	emit_signal('client_input', id, value)
	
	if verbose:
		print('Client %s: input signal %s' % [id, value])
		
func send_output(value):
	emit_signal('client_output', id, value)
	
	if verbose:
		print('Client %s: output signal %s' % [id, value])
		
func client_joined(id):
	return
	
func client_parted(id):
	return
	
func process(id, value):
	#send_output(value)
	if verbose:
		print('Client %s: processing %s from %s' % [self.id, value, id])
	return
	
func update(id, value):
	#handle update data
	if verbose:
		print('Client %s: updating %s from %s' % [self.id, value, id])
	

	
