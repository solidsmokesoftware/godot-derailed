extends 'res://DerailClient.gd'

sprites = {}

var sprite_texture = load('res://icon.png')

func new_actor(controller):
	var sprite = Sprite.new()
	sprite.texture = sprite_texture
	sprite.controller = controller
	sprites.append(sprite)

func process(sender, output):
	print('View: outputting %s' % output)
	for actor in output:
		if sprites.has(actor):
			sprites[actor].location = output[actor].location
		except:
			sprites[actor] = new_actor()
			sprites[actor].location = output[actor].location
			