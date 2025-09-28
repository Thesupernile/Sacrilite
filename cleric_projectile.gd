extends Area2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
var velocity := Vector2()

func _ready():
	animated_sprite_2d.play()
	
func _physics_process(delta):
	global_position += velocity * delta
