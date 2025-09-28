extends Area2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
var velocity := Vector2()

func _ready():
	animated_sprite_2d.play()
	
func _physics_process(delta):
	global_position += velocity * delta

func _on_area_shape_entered(_area_rid: RID, area: Area2D, _area_shape_index: int, _local_shape_index: int) -> void:
	if area.is_in_group("player"):
		area.owner.damage()
		queue_free()
