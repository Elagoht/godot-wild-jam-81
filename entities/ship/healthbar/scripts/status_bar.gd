extends Node2D

@onready var hp_bar: Line2D = $HPBar
@onready var max_hp: float = owner.max_hp

func _ready() -> void:
	modulate = get_hp_color(max_hp)

func _on_ship_hp_changed(new_hp: float) -> void:
	var percentage = new_hp / max_hp * 128
	hp_bar.set_point_position(1, Vector2(percentage, 0))
	modulate = get_hp_color(new_hp)

func get_hp_color(hp: float):
	return Color(
		1 - hp / max_hp,
		hp / max_hp,
		0.5
	)
