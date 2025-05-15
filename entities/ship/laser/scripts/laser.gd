extends Node2D

@onready var rotatable: Node2D = $Rotatable
@onready var ray: RayCast2D = $Rotatable/Ray
@onready var line: Line2D = $Rotatable/Line
@onready var max_width: float = 500

func _process(_delta: float) -> void:
	if ray.is_colliding():
		line.default_color = Color(1, 0, 0)
		line.set_point_position(1, rotatable.to_local(ray.get_collision_point()))
	else:
		line.default_color = Color(0, 0, 1)
		line.set_point_position(1, Vector2(max_width, 0))
