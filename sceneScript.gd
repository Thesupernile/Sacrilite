class_name SceneScript extends Node

@onready var player: Player = $Player
@onready var enterance_markers: Node2D = $enterance_markers

func _ready():
	if (global.player):
		if player:
			player.queue_free()
		player = global.player
		add_child(player)
	position_player()

	
func position_player() -> void:
	var last_scene = global.last_scene_name
	if last_scene.is_empty():
		last_scene = "any"
	
	for enterance in enterance_markers.get_children():
		var enteranceName = enterance.name
		if enterance is Marker2D and (enterance.name == "any" or enteranceName == last_scene):
			player.global_position = enterance.global_position
			break
