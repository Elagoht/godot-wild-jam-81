extends Area2D

@onready var triggerer_sprite = $Sprite
@onready var shield_sprite = $Shield/Sprite
@onready var shield_collision = $Shield/Collision
@onready var players_on_it: Array[String] = []

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		if body.has_method("get_player_id"):
			players_on_it.append(body.get_player_id())

func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		if body.has_method("get_player_id"):
			players_on_it.erase(body.get_player_id())

func _physics_process(delta: float) -> void:
	var is_active = 1 if len(players_on_it) else 0
	# Set triggerer pad color
	if is_active:
		owner.use_energy(25 * delta)
	if owner.energy < 1:
		players_on_it = []
	triggerer_sprite.modulate = Color(1, 1, 1) if is_active else Color(0.3, 0.3, 0.3)
	# Set shield state
	shield_sprite.visible = is_active
	shield_collision.disabled = !is_active
