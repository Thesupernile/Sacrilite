extends Node2D

func _ready():
	pass

func sacrificeChosen():
	self.get_tree().call_deferred("change_scene_to_file", global.next_scene_path)


func _on_sacrifice_health_pressed() -> void:
	global.player.hp -= 1
	if global.player.hp == 0:
		self.get_tree().call_deferred("change_scene_to_file", "res://Scenes/GameOver.tscn")
	else:
		sacrificeChosen()


func _on_sacrifice_damage_pressed() -> void:
	global.player.playerDamage -= 1
	if global.player.playerDamage <= 1:
		global.player.playerDamage = 1
	sacrificeChosen()


func _on_sacrifice_speed_pressed() -> void:
	global.player.speed = snapped(global.player.speed * 0.8, 1)
	if global.player.speed <= 1:
		global.player.speed = 1
	sacrificeChosen()


func _on_sacrifice_attack_speed_pressed() -> void:
	global.player.attackCooldown += 0.3
	if global.player.speed <= 1:
		global.player.speed = 1
	sacrificeChosen()
