extends Node

var save_path = "res://save/game_save.json"

onready var player = preload("res://Player/Player.tscn").instance()


var highscore 
var score

func _ready():
	
	#load save file
	var load_text = load_game()
	
	score = player.coins_collected
	
	highscore = load_text["player"]["highscore"]
	
	print(score)
	
	#highscore handler
	if score > highscore:
		load_text["player"]["highscore"] = score
	
	print(score)
	#save game
	save_game(load_text)

func load_game():
	var file = File.new()
	file.open(save_path, File.READ)
	var text = parse_json(file.get_as_text())
	return text
	file.close()

func save_game(data):
	var file = File.new()
	file.open(save_path, File.WRITE)
	file.store_line(to_json(data))
	
	file.close()

