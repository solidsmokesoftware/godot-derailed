extends Node2D

var manager = load('res://DerailManager.gd').new()

var logic = load('res://Logic.gd').new()

var view = load('res://View.gd').new()
var bot = load('res://Bot.gd')
var player = load('res://Player.gd').new()
var player2 = load('res://Player.gd').new()

func _init():
	start()
	
func start():
	manager.process('prep', 'system')
	logic.add_manager('Logic', manager)
	view.add_manager('View', manager)
	player.add_manager('Player', manager)
	player2.add_manager('Player2', manager)
	