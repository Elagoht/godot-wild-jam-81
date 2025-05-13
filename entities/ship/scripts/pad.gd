extends Area2D

@export var direction: Vector2

@onready var parent := $"../.."
@onready var players_on_it := []
@onready var sprite := $Sprite

func _ready() -> void:
	sprite.visible = false

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
	parent.move_and_collide(direction * delta * parent.speed * is_active)
	sprite.visible = len(players_on_it) > 0
