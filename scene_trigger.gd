class_name SceneTrigger extends Area2D

@export var connected_scene: String # name of scene to change to
@export var playerActivated: bool

func _on_body_entered(_body: Node2D) -> void:
	if _body is Player:
		global.changeScenes(get_owner(), connected_scene)
