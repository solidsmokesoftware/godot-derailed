extends Node2D

onready var sprite = get_node('KinematicBody2D/Sprite')



func process(location):
	if sprite != null:
		sprite.position.x += location[0]
		sprite.position.y += location[1]
		print(sprite.position)