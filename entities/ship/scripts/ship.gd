extends CharacterBody2D

@export var speed = 50
@export var max_hp: float = 100
@onready var hp: float = max_hp

@onready var status_bar: Node2D = $StatusBar

signal hp_changed(new_hp: float)

func on_hp_changed(new_hp: float):
	hp = new_hp
	hp_changed.emit(hp)

func take_damage(amount: float):
	hp -= amount
	if hp < 0:
		hp = 0
	hp_changed.emit(hp)

func heal(amount: float):
	hp += amount
	if hp > max_hp:
		hp = max_hp
	hp_changed.emit(hp)
	
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("debug_hp_down"):
		take_damage(10)
	if Input.is_action_just_pressed("debug_hp_up"):
		heal(10)
