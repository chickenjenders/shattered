extends CanvasLayer

func _ready():
	# This function runs when the title screen is first loaded
	pass

func _on_button_pressed() -> void:
	var main_game_scene = preload("res://Scenes/main.tscn").instantiate()
	get_tree().root.add_child(main_game_scene)

	# Optionally, remove or hide the title screen after loading the main game
	queue_free() # Remove the title screen itself
