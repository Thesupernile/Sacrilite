class_name enemyBase extends CharacterBody2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@export var speed := 50
@export var hp = 5

func _ready():
	global.connect("enemyHitSignal", enemyHit)
	animated_sprite_2d.play()

func enemyDead():
	self.queue_free()

func enemyHit(damage, nodeHit):
	if nodeHit == $HurtboxArea:
		hp -= damage
		animated_sprite_2d.modulate = Color(1, 0, 0)
		await get_tree().create_timer(0.15).timeout
		animated_sprite_2d.modulate = Color(1, 1, 1)
		if hp <= 0:
			enemyDead()
			
