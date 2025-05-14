extends Node2D

@onready var hp_bar: Line2D = $HPBar
@onready var energy_bar: Line2D = $EnergyBar

@onready var max_hp: float = owner.max_hp
@onready var max_energy: float = owner.max_energy

func _ready() -> void:
	hp_bar.modulate = get_hp_color(max_hp)
	energy_bar.modulate = get_energy_color(max_energy)

func _on_ship_hp_changed(new_hp: float) -> void:
	var percentage = new_hp / max_hp * 128
	hp_bar.set_point_position(1, Vector2(percentage, 0))
	hp_bar.modulate = get_hp_color(new_hp)

func _on_ship_energy_changed(new_energy: float) -> void:
	var percentage = new_energy / max_energy * 104
	energy_bar.set_point_position(1, Vector2(percentage, 0))
	energy_bar.modulate = get_energy_color(new_energy)

func get_hp_color(hp: float) -> Color:
	var ratio = clamp(hp / max_hp, 0.0, 1.0)
	return Color(1.0 - ratio, ratio, 0.0)

func get_energy_color(energy: float) -> Color:
	var ratio = clamp(energy / max_energy, 0.0, 1.0)
	return Color(0.0, ratio, ratio)
