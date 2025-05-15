extends StaticBody2D

@onready var gass: Area2D = $Gass
@onready var timer: Timer = $Timer
@onready var delay: Timer = $Delay
@onready var scaling: float = 1
@onready var is_growing: bool = true
@onready var started: bool = false

func _ready() -> void:
	randomize()
	delay.wait_time = randf_range(0, 3)
	delay.start()
	gass.scale = Vector2(0, 0)
	gass.body_entered.connect(_on_gass_body_entered)

func _process(delta: float) -> void:
	if not started:
		return

	var target_scale = Vector2(
		1, 1
	) if is_growing else Vector2(
		0, 0
	)
	gass.scale = gass.scale.lerp(target_scale, delta * 0.4)

func _on_timer_timeout() -> void:
	is_growing = not is_growing

func _on_gass_body_entered(body):
	if body.is_in_group("player"):
		body.take_damage(10)

func _on_delay_timeout() -> void:
	started = true
	timer.start()
