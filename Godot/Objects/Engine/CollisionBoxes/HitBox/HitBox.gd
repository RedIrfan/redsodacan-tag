class_name HitBox
extends CollisionBox

signal hit(area)

@export var exception_group : String
@export var attack_position : Node

var damage_data : HurtData
var hurtbox_list : Array[HurtBox] #for all hurtboxes that entered this hitbox
var hit_list : Array[HurtBox] #for all hurtboxes that entered and has been hit/sent a hurt data


func _ready():
	set_collision_layer_value(9, true)
	set_collision_mask_value(10, true)
	
	area_entered.connect(_on_area_entered)


func set_damage(damage, damage_type:Global.DAMAGES=Global.DAMAGES.NONE) -> void:
	damage_data = HurtData.new(damage, damage_type, body)
	
	hit_list.clear()
	for hurtbox in hurtbox_list:
		process_attack(hurtbox)


func _on_area_entered(hurtbox) -> void:
	if hurtbox.get_class() != HurtBox or hurtbox.body == body or hurtbox.body.is_in_group(exception_group):
		return
	
	hurtbox_list.append(hurtbox)
	if damage_data.damage > 0:
		process_attack(hurtbox)


func _on_area_exited(hurtbox) -> void:
	if hurtbox.get_class() != HurtBox:
		return
	
	if hurtbox in hurtbox_list:
		hurtbox_list.erase(hurtbox)


func process_attack(hurtbox:HurtBox) -> void:
	if hurtbox in hit_list:
		return
	
	var attack_pos : Vector3 = self.global_position if attack_position == null else attack_position.global_position
	
	damage_data.attack_position = attack_pos
	hurtbox.set_hurt_data(damage_data)
	
	hit_list.append(hurtbox)
	hit.emit(hurtbox)
