class_name SceneManager extends Node

var player
var player_position := Vector2()
var last_scene_name: String
var next_scene_path: String

@warning_ignore("unused_signal")
signal enemyHitSignal(damage : int, nodeHit : Area2D)
signal playerDamaged

var scene_folder := "res://Scenes/"

func changeScenes(from, to_scene_name: String) -> void:
	last_scene_name = from.name
	player = from.player
	player.get_parent().remove_child(player)
	
	next_scene_path = scene_folder + to_scene_name + ".tscn"
	from.get_tree().call_deferred("change_scene_to_file", scene_folder + "sacrifices.tscn")
