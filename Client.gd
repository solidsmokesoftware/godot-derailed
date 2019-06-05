extends Node

signal action

var id
var manager

func send(value):
	print('signal emitted: s% - s%' % [id, value])
	emit_signal('action', id, value)
	
func process(output):
	return
		