extends CharacterBody2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

var speed := 150
enum Direction {
	LEFT,
	RIGHT
}
var facing = Direction.LEFT

func _physics_process(delta):
	var direction := Input.get_vector("left", "right", "up", "down")
	if direction.x > 0:
		facing = Direction.RIGHT
		animated_sprite_2d.flip_h = true
	elif direction.x < 0:
		facing = Direction.LEFT
		animated_sprite_2d.flip_h = false

		
	velocity = direction * speed
	move_and_slide()
