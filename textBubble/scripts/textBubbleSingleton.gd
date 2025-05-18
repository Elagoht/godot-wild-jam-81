extends Node

@onready var dialog_manager = get_tree().get_root().get_node("MainLevel/Ship/UI/DialogRoot")

var map_dialogs := {
	1: ["Khajiit has wares if you have coin."],
	2: ["Void"],
	3: ["Void"]
}

func show_map_hint(map_id: int):
	print("Debug: Waking up textBubble is successful!")
	if map_dialogs.has(map_id):
		dialog_manager.start_dialog(map_dialogs[map_id])
	else:
		print("No dialog set for map ID:", map_id)
