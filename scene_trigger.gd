class_name SceneTrigger extends Area2D
@onready var sprite_2d: Sprite2D = $Sprite2D

@export var connected_scene: String # name of scene to change to
@export var playerActivated: bool
@export var disabled = true

func _on_body_entered(_body: Node2D) -> void:
	if not disabled and _body is Player:
		global.changeScenes(get_owner(), connected_scene)

func disable():
	sprite_2d.modulate = Color(0,0,0)
	disabled = true

func enable():
	sprite_2d.modulate = Color(1,1,1)
	disabled = false
