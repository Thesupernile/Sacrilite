class_name enemyBase extends CharacterBody2D

@export var hp = 5

func _ready():
	global.connect("enemyHitSignal", enemyHit)

func enemyDead():
	get_owner().remove_child(self)

func enemyHit(damage, nodeHit):
	if nodeHit == $HurtboxArea:
		hp -= damage
		print(hp)
		if hp <= 0:
			enemyDead()
