extends Node2D
@onready var portal: SceneTrigger = $"../Portal"

func _process(_delta: float) -> void:
	if get_child_count() == 0:
		portal.enable()
	else:
		portal.disable()
