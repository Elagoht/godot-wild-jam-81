extends State

@onready var parent := $"../.."
@onready var player_suffix: String = "_" + parent.player_id

func enter():
	pass
	
func physics_update(_delta: float) -> void:
	parent.velocity.x = Input.get_axis("move_left" + player_suffix, "move_right" + player_suffix)
	parent.velocity.y = Input.get_axis("move_up" + player_suffix, "move_down" + player_suffix)
	
	parent.velocity = parent.velocity.normalized() * parent.speed
	
	parent.move_and_slide()

	# If no input and velocity is near zero, return to idle
	if abs(parent.velocity.x) == 0 and abs(parent.velocity.y) == 0 :
		state_machine.transition_to("idle")
