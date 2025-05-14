extends CharacterBody2D

@export var speed = 50
@export var max_hp: float = 100
@export var max_energy: float = 100
@onready var hp: float = max_hp
@onready var energy: float = max_energy

@onready var status_bar: Node2D = $StatusBar

signal hp_changed(new_hp: float)
signal energy_changed(new_energy: float)

func on_hp_changed(new_hp: float) -> void:
	hp = new_hp
	hp_changed.emit(hp)

func take_damage(amount: float) -> void:
	hp -= amount
	if hp < 0:
		hp = 0
	hp_changed.emit(hp)

func heal(amount: float) -> void:
	hp += amount
	if hp > max_hp:
		hp = max_hp
	hp_changed.emit(hp)

func gain_energy(amount: float) -> void:
	energy += amount
	if energy > max_energy:
		energy = max_energy
	energy_changed.emit(energy)

func use_energy(amount: float) -> void:
	energy -= amount
	if energy < 0:
		energy = 0
	energy_changed.emit(energy)

func _process(delta: float) -> void:
	gain_energy(delta * 10.0)
	if Input.is_action_just_pressed("debug_hp_down"):
		take_damage(10.0)
		use_energy(10.0)
	if Input.is_action_just_pressed("debug_hp_up"):
		heal(10.0)
		gain_energy(10.0)
