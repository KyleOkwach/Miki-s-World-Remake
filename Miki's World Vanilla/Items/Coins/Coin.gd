extends Area2D

export(int) var value

func _on_GoldCoin_area_entered(area: Area2D):
	if area.is_in_group("Player"):
		queue_free()
