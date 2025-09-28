extends CharacterBody2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@export var hp := 5
@export var speed := 50
@export var projectile_speed := 40
@export var attack_cooldown_seconds := 2.0
@export var flee_range : float
@export var chase_range : float
@export var Projectile : PackedScene

var seconds_since_last_attack := 0.0

enum Direction {
	LEFT,
	RIGHT
}
var facing := Direction.LEFT

func _ready():
	animated_sprite_2d.play()

func _physics_process(delta):
	var distance := global.player_position - global_position
	var direction := distance.normalized()
	
	seconds_since_last_attack += delta
	if seconds_since_last_attack > attack_cooldown_seconds:
		seconds_since_last_attack = 0
		var projectile = Projectile.instantiate()
		owner.add_child(projectile)
		projectile.global_position = global_position
		projectile.scale *= 0.25
		projectile.velocity = direction * projectile_speed
	
	if distance.length() < flee_range:
		direction *= -1
	elif distance.length() < chase_range:
		direction *= 0

	if direction.x > 0:
		facing = Direction.RIGHT
		animated_sprite_2d.flip_h = true
	elif direction.x < 0:
		facing = Direction.LEFT
		animated_sprite_2d.flip_h = false

	velocity = direction * speed
	move_and_slide()
	

		
