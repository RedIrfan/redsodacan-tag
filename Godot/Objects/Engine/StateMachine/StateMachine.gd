class_name StateMachine
extends Node

@export var body : Node
@export var initial_state : State

var states : Dictionary = {}

var previous_state : State
var current_state : State
var next_state : State


func _ready():
	for child in get_children():
		if child is State:
			states[child.name.to_lower()] = child
	
	enter_state(initial_state.name)


func enter_state(state_name:String, msg=[]) -> bool:
	state_name = state_name.to_lower()
	if state_name in states:
		next_state = states[state_name]
		next_state.body = body
		next_state.fsm = self
		
		if next_state.enter_condition(msg) == false:
			return false
		
		if current_state:
			await current_state.exit()
			previous_state = current_state
		
		current_state = next_state
		current_state.enter(msg)
		
		return true
	return false


func _physics_process(delta):
	if current_state:
		current_state.physics_process(delta)


func _process(delta):
	if current_state:
		current_state.process(delta)
