extends Node2D

@export var firstScene := "level_1"

var firstScenePath = "res://Scenes/level_1.tscn"
@onready var player = $Player

func _on_play_button_pressed() -> void:
	global.changeScenes(self, firstScene)
