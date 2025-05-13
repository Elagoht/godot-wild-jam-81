extends Area2D

@onready var is_active: bool = false
@onready var triggerer_sprite = $Sprite
@onready var shield_sprite = $Shield/Sprite
@onready var shield_collision = $Shield/Collision
@onready var players_on_it := []

func _on_body_entered(body: Node2D) -> void:
	print(body.get_groups())
	if body.is_in_group("player"):
		print(body)
		if body.has_method("get_player_id"):
			print(body.get_player_id())
			players_on_it.append(body.get_player_id())

func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		if body.has_method("get_player_id"):
			players_on_it.erase(body.get_player_id())

func _physics_process(_delta: float) -> void:
	var is_active = 1 if len(players_on_it) else 0
	# Set triggerer pad color
	triggerer_sprite.modulate = Color(1,1,1) if is_active else Color(0.3,0.3,0.3)
	# Set shield state
	shield_sprite.visible = is_active
	shield_collision.disabled = !is_active
