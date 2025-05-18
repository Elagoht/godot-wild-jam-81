extends Node

var text_box_scene = preload("res://textBubble/Scenes/text_box.tscn")

var dialog_lines: Array = []
var current_line_index = 0
var text_box
var is_dialog_active = false
var can_advance_line = false

func start_dialog(lines: Array):
	if is_dialog_active:
		return
	dialog_lines = lines
	_show_text_box()
	
	is_dialog_active = true
	
func _show_text_box():
	if text_box_scene == null:
		print("Debug: The value of text_box_scene is ", text_box_scene)
	else:
		print("Debug: The value of text_box_scene is ", text_box_scene)
		text_box = text_box_scene.instantiate()
		text_box.finished_displaying.connect(_on_text_box_finished_displaying)
		add_child(text_box)
		await get_tree().process_frame
		text_box.display_text(dialog_lines[current_line_index])
	
func _on_text_box_finished_displaying():
	can_advance_line = true
	
	# Wait 4 seconds, then hide the TextBox
	await get_tree().create_timer(4.0).timeout
	
	if text_box: # Double-check it's still there
		text_box.queue_free()
		
	current_line_index += 1
	if current_line_index >= dialog_lines.size():
		is_dialog_active = false
		current_line_index = 0
	else:
		can_advance_line = false
		_show_text_box()
		
