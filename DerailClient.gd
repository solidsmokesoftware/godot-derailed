extends Node

signal action

var index = 0
var manager

func send(value):
	print('signal emitted: %s - %s' % [index, value])
	emit_signal('action', index, value)
	
func process(output):
	return