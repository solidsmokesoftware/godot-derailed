extends Node

signal output

var clients = []
var logic

func _init():
	print('started')

func set_logic(logic):
	self.logic = logic
	self.logic.start()
	
func add_client(client):
	clients.append(client)
	client.index
	client.manager = self
	client.connect('action', self, 'process')
	self.connect('output', client, 'process')
	
func pop_client(index):
	clients[index].manager = null
	clients[index].disconnect('action', self, 'process')
	self.disconnect('output', clients[index], 'process')
	clients.erase(index)

func process(sender, event, args):
	logic.process(sender, event, args)
	emit_signal('output', logic.output())
		
		
	