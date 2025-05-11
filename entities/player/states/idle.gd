extends State

@onready var parent := $"../.."
@onready var player_suffix: String = "_" + parent.player_id

func enter() -> void:
	pass
	
func physics_update(_delta: float) -> void:
	pass

func handle_input(_event: InputEvent) -> void:
	for key in ["move_left", "move_right", "move_up", "move_down"]:
		if Input.is_action_pressed(key + player_suffix):
			state_machine.transition_to("move")
			return
