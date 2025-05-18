extends Node2D

var scene = preload("res://textBubble/Scenes/text_box.tscn")

func _ready():
	print("Scene Type:", typeof(scene))
	print("Scene Class:", scene.get_class())
	var instance = scene.instantiate()
	add_child(instance)
	TextBubbleSingleton.show_map_hint(1) 
