class_name HurtBox
extends CollisionBox

@export var health_component : Node

var hurt_data : HurtData


func set_hurt_data(new_hurt_data:HurtData) -> void:
	if health_component:
		health_component.set_hurt_data(new_hurt_data)
