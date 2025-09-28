class_name enemyBase extends CharacterBody2D

@export var hp = 5

func _ready():
	global.connect("enemyHit", enemyHit)

func enemyDead():
	get_owner().remove_child(self)

func enemyHit():
	hp -= 1
	if hp <= 0:
		enemyDead()
