class_name HurtData
extends Resource

var damage : int = 0
var damage_type : Global.DAMAGES = Global.DAMAGES.NONE
var attacker : Node = null
var attack_position : Vector3 = Vector3.ZERO


func _init(_damage:int, _damage_type:Global.DAMAGES=Global.DAMAGES.NONE, _attacker:Node=null, _attack_position:Vector3=Vector3.ZERO):
	damage = _damage
	damage_type = _damage_type
	attacker = _attacker
	attack_position = _attack_position
