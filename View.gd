extends 'res://DerailClient.gd'

var sprites = {}
var actor

var sprite_texture = load('res://icon.png')

func _init():
	client_name = 'View'

func new_sprite(controller):
	var sprite = Sprite.new()
	sprite.texture = sprite_texture
	add_child(sprite)
	return sprite

func process_output(sender, output):
	print('View: outputting %s' % str(output))
	for key in output:
		actor = output[key]
		if sprites.has(actor.controller):
			sprites[actor.controller].position = actor.location
		else:
			sprites[actor.controller] = new_sprite(actor.controller)
			