extends enemyBase
@export var projectile_speed := 40
@export var attack_cooldown_seconds := 2.0
@export var flee_range : float
@export var chase_range : float
@export var Projectile : PackedScene
@export var linkedEnemy : enemyBase

var seconds_since_last_attack := 0.0
@export var facingLeft := true

func _physics_process(delta):
	var distance := global.player_position - global_position
	var direction := distance.normalized()
	if !is_instance_valid(linkedEnemy):
		enemyDead()
	
	seconds_since_last_attack += delta
	if seconds_since_last_attack > attack_cooldown_seconds:
		seconds_since_last_attack = 0
		var projectile = Projectile.instantiate()
		owner.add_child(projectile)
		projectile.global_position = global_position
		projectile.scale *= 0.25
		projectile.velocity = direction * projectile_speed
		
	if facingLeft:
		animated_sprite_2d.flip_h = false
	else:
		animated_sprite_2d.flip_h = true
		
		
