class_name enemyBase extends CharacterBody2D

@export var hp = 5

func _on_player_enemy_hit_signal():
	hp -= 1
