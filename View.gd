extends 'res://DerailClient.gd'

var sprite_texture = load('res://icon.png')

func process(output):
	print('outputting')
	for location in output:
		var sprite = Sprite.new()
		sprite.texture = sprite_texture
		sprite.position = location