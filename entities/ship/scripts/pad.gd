extends Area2D

@export var direction: Vector2

@onready var is_active: bool = false
@onready var parent := $"../.."

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		is_active = true
		$Collision.modulate = Color(1, 0, 1)

func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		is_active = false
		$Collision.modulate = Color(1, 1, 1)

func _physics_process(delta: float) -> void:
	if is_active:
		parent.move_and_collide(direction * delta * parent.speed)
