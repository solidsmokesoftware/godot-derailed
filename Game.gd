extends Node

var mainMenuInput = load('res://MainMenuI.gd').new()
var mainMenuLogic = load('res://MainMenuL.gd').new()
var mainMenuOutput = load('res://MainMenuO.gd').new()
var exploreScreenInput = load('res://PlayerI.gd').new()
var exploreScreenLogic = load('res://ExploreScreenL.gd').new()
var exploreScreenOutput = load('res://ExploreScreenO.gd').new()

#####

var inputClients = []
var outputClients = []
var logicManager

func _init():
	print('started')
	process(-2)

func connectLogic(manager):
	logicManager = manager
	logicManager.start()
	
func connectInput(client):
	inputClients.append(client)
	
func connectOutput(client):
	outputClients.append(client)
	
func _input(event):
	for client in inputClients:
		process(client.process(event))

func process(value):
	if value == -1:
		connectInput(mainMenuInput)
		connectLogic(mainMenuLogic)
		connectOutput(mainMenuOutput)
	elif value == -2:
		connectInput(exploreScreenInput)
		connectLogic(exploreScreenLogic)
		connectOutput(exploreScreenOutput)
	else:	
		logicManager.process(value)
	
	for client in outputClients:
		client.process(logicManager.output())
		
		
	