extends Node2D

var manager = load('res://DerailManager.gd').new()

var logic = load('res://Logic.gd').new()
var view = load('res://View.gd').new()
var bot = load('res://Bot.gd').new()
var player = load('res://Player.gd').new()

func _init():
	manager.add_client(logic)
	manager.add_client(view)
	manager.add_client(player)
	manager.start()