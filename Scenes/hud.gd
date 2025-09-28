extends Node2D

@onready var health_bar: AnimatedSprite2D = $"CanvasLayer/health bar"

var val = 0

func _ready() -> void:
	global.connect("playerDamaged", updateHealthBar)
	val = 5 - global.player.hp
	
func updateHealthBar():
	val += 1
	health_bar.frame = val
	pass
