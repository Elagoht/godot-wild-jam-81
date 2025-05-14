extends StaticBody2D

@onready var gass: Area2D = $Gass
@onready var timer: Timer = $Timer
@onready var scaling: float = 1
@onready var is_growing: bool = true

func _ready() -> void:
	gass.scale = Vector2(0, 0)

func _process(delta: float) -> void:
	var target_scale = Vector2(
		1, 1
	) if is_growing else Vector2(
		0, 0
	)
	gass.scale = gass.scale.lerp(target_scale, delta * 0.4)

func _on_timer_timeout() -> void:
	is_growing = not is_growing
