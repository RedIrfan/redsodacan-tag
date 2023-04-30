class_name HealthComponent
extends Node

signal hurt(hurt_data)
signal dead(last_hurt_data)

@export var MAX_HEALTH : int = 100

var health : int = MAX_HEALTH
var hurt_data : HurtData = null


func set_hurt_data(_hurt_data:HurtData):
	health -= _hurt_data.damage
	
	if health <= 0:
		dead.emit(_hurt_data)
	else:
		hurt.emit(_hurt_data)
