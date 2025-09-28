extends Node2D

@export var firstScene := "level_1"

var firstScenePath = "res://Scenes/" + firstScene + ".tscn"

func _on_play_button_pressed() -> void:
	global.changeScenes(get_owner(), firstScene)
