extends CanvasLayer

onready var player = get_parent()

var max_life = 4

onready var coins = $Control/MarginContainer/CoinContainer/Coins
onready var health = $Control/MarginContainer/LifeContainer/Health

func _process(delta):
	coins.text = str(player.coins_collected)
	health.text = str(player.life)
