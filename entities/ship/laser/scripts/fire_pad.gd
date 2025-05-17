extends Area2D

@onready var parent: Node2D = $".."
@onready var players_on_it: Array[String] = []
@onready var sprite: Sprite2D = $CollisionShape2D/Sprite

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		if body.has_method("get_player_id"):
			players_on_it.append(body.get_player_id())

func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		if body.has_method("get_player_id"):
			players_on_it.erase(body.get_player_id())

func _physics_process(_delta: float) -> void:
	var is_active = 1 if len(players_on_it) else 0
	sprite.modulate = Color(0, 1, 0) if is_active else Color(1, 1, 1)
	if is_active:
		# Fire lavender here
		pass	
