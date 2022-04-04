extends CanvasLayer

#export(NodePath) var player
var player = load("res://Player/Player.tscn")
#var player = get_tree("Player")

var max_life = 4

onready var coins = $MarginContainer/CoinContainer/Coins
onready var health = $MarginContainer/LifeContainer/Health

func _process(delta):
	#coins.text = player.coins_collected
	#health.text = player.life
	pass
