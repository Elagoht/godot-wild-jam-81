extends Area2D

@export var direction: Vector2

@onready var parent := $"../.."
@onready var players_on_it := []
@onready var sprite := $Sprite

func _ready() -> void:
	sprite.visible = false

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		if body.has_method("getPlayerId"):
			players_on_it.append(body.player_id)

func _on_body_exited(body: Node2D) -> void:
	if body.has_method("getPlayerId"):
		if body.is_in_group("player"):
			players_on_it.erase(body.player_id)

func _physics_process(delta: float) -> void:
	parent.move_and_collide(direction * delta * parent.speed * len(players_on_it))
	sprite.visible = len(players_on_it) > 0
