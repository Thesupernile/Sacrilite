class_name enemyBase extends CharacterBody2D

@export var hp = 5

func _ready():
	global.connect("enemyHitSignal", enemyHit)

func enemyDead():
	get_owner().remove_child(self)

func enemyHit():
	print(hp)
	hp -= 1
	if hp <= 0:
		enemyDead()
