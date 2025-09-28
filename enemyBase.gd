class_name enemyBase extends CharacterBody2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@export var speed := 50
@export var hp = 5
var iframes_max = 0.3
var iframes = 0.0

func _ready():
	global.connect("enemyHitSignal", enemyHit)
	animated_sprite_2d.play()

func enemyDead():
	self.queue_free()

func enemyHit(damage, nodeHit):
	if nodeHit == $HurtboxArea and iframes <= 0.0:
		hp -= damage
		iframes = iframes_max
		if hp <= 0:
			enemyDead()
			
