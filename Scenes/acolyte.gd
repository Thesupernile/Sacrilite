extends enemyBase
@export var chase_range : float

enum Direction {
	LEFT,
	RIGHT
}
var facing = Direction.LEFT

func _physics_process(_delta):
	var distance := global.player_position - global_position
	if distance.length() > chase_range or distance.length() < 20:
		distance *= 0
		animated_sprite_2d.pause()
		animated_sprite_2d.frame = 0
	else:
		animated_sprite_2d.play()
	var direction := distance.normalized()
	if direction.x > 0:
		facing = Direction.RIGHT
		animated_sprite_2d.flip_h = true
	elif direction.x < 0:
		facing = Direction.LEFT
		animated_sprite_2d.flip_h = false

	velocity = direction * speed
	move_and_slide()
