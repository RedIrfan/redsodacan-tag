class_name HurtBox
extends CollisionBox

@export var health_component : Node

var hurt_data : HurtData


func _ready():
	set_collision_layer_value(10, true)
	set_collision_mask_value(9, true)


func set_hurt_data(new_hurt_data:HurtData) -> void:
	if health_component:
		health_component.set_hurt_data(new_hurt_data)
