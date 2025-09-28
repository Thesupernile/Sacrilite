class_name Player extends CharacterBody2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

@onready var LeftAttackHitbox: CollisionShape2D = $AttackLeft/AttackLeftBox
@onready var RightAttackHitbox: CollisionShape2D = $AttackRight/AttackRightBox
@onready var hurtbox_area: Area2D = $HurtboxArea


@export var speed := 150
@export var hp := 5

var speed := 150
var playerDamage := 5
var isAttacking := false
enum Direction {
	LEFT,
	RIGHT
}
var facing := Direction.LEFT

func _ready():
	hurtbox_area.add_to_group("player")

func checkAttack():
	if Input.is_action_just_pressed("attack"):
		isAttacking = true
	
	if isAttacking:
		if facing == Direction.LEFT:
			LeftAttackHitbox.disabled = false
			RightAttackHitbox.disabled = true
		else:
			LeftAttackHitbox.disabled = true
			RightAttackHitbox.disabled = false
			

func enemyHit():
	if isAttacking:
		emit_signal("enemyHitSignal")

func _physics_process(_delta):
	global.player_position = global_position
	
	var direction := Input.get_vector("left", "right", "up", "down")
	if direction.x > 0:
		facing = Direction.RIGHT
		animated_sprite_2d.flip_h = true
	elif direction.x < 0:
		facing = Direction.LEFT
		animated_sprite_2d.flip_h = false
		
	if isAttacking:
		animated_sprite_2d.play("attack")
	elif direction.x == 0 and direction.y == 0:
		animated_sprite_2d.play("idle")
	else:
		animated_sprite_2d.play("run")
		
	checkAttack()
		
	velocity = direction * speed
	move_and_slide()


func _on_animated_sprite_2d_animation_finished() -> void:
	if isAttacking:
		isAttacking = false

func damage():
	hp -= 1

func _on_attack_right_area_shape_entered(_area_rid: RID, _area: Area2D, _area_shape_index: int, _local_shape_index: int) -> void:
	global.emit_signal("enemyHitSignal", playerDamage, area)

func _on_attack_left_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	global.emit_signal("enemyHitSignal", playerDamage, area)
