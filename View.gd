extends 'res://DerailClient.gd'

var sprites = {}

var sprite_texture = load('res://icon.png')


func new_actor(controller):
	var sprite = Sprite.new()
	sprite.texture = sprite_texture
	sprite.controller = controller
	sprites.append(sprite)

func process_output(output):
	print('View: outputting %s' % output)
	for actor in output:
		if sprites.has(actor):
			sprites[actor].location = output[actor].location
		else:
			sprites[actor] = new_actor(actor)
			sprites[actor].location = output[actor].location
			