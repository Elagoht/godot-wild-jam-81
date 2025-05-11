extends Area2D

@export var direction: Vector2

@onready var parent := $"../.."
@onready var players_on_it = []

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		players_on_it.append(body)

func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		players_on_it.erase(body)
		

func _physics_process(delta: float) -> void:
	parent.move_and_collide(direction * delta * parent.speed * len(players_on_it))
