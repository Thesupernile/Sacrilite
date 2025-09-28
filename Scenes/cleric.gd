extends CharacterBody2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@export var hp = 5
@export var flee_range : float
@export var chase_range : float

var speed := 50
enum Direction {
	LEFT,
	RIGHT
}
var facing = Direction.LEFT

func _ready():
	animated_sprite_2d.play()

func _physics_process(_delta):
	var distance = global.player_position - global_position
	if distance.length() < flee_range:
		distance *= -1
	elif distance.length() < chase_range:
		distance *= 0

	var direction = distance.normalized()
	if direction.x > 0:
		facing = Direction.RIGHT
		animated_sprite_2d.flip_h = true
	elif direction.x < 0:
		facing = Direction.LEFT
		animated_sprite_2d.flip_h = false

	velocity = direction * speed
	move_and_slide()
