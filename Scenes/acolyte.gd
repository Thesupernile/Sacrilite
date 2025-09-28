extends enemyBase
@export var chase_range : float
@onready var attack_area: Area2D = $AttackArea

enum Direction {
	LEFT,
	RIGHT
}
var facing := Direction.LEFT
var attacking := false

func _physics_process(_delta):
	if attacking:
		return
	var distance := global.player_position - global_position
	if distance.length() < 20:
		distance *= 0
		animated_sprite_2d.play("attack")
		attacking = true
		await get_tree().create_timer(0.8).timeout
		print("a")
		for area in attack_area.get_overlapping_areas():
			if area.is_in_group("player"):
				area.owner.damage()
		await get_tree().create_timer(0.2).timeout
		attacking = false
	elif distance.length() > chase_range:
		distance *= 0
		animated_sprite_2d.play("run")
		animated_sprite_2d.pause()
		animated_sprite_2d.frame = 0
	else:
		animated_sprite_2d.play("run")
	var direction := distance.normalized()
	if direction.x > 0:
		facing = Direction.RIGHT
		animated_sprite_2d.flip_h = true
	elif direction.x < 0:
		facing = Direction.LEFT
		animated_sprite_2d.flip_h = false

	velocity = direction * speed
	move_and_slide()
