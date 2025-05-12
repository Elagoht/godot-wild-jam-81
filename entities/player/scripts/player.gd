extends CharacterBody2D

@export var player_id: String = "1"
var speed = 100

@onready var state_machine: StateMachine = $StateMachine

func _ready() -> void:

	if is_inside_tree():
		await get_tree().process_frame
	if state_machine:
		state_machine.transition_to("idle")
	else:
		push_error("State machine not found!")

func getPlayerId():
	return player_id
