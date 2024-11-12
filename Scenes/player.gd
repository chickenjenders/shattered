extends AnimatedSprite2D

var keys_to_check = [KEY_S, KEY_C, KEY_D, KEY_F, KEY_SPACE, KEY_Q] # Add the keys you want to check
var default_frame = 0 # Set this to your default frame index

var can_interact_with_mirror = false

func _ready():
	frame = default_frame

func _process(_delta):
	var keys_pressed = 0

	print(frame)
	if can_interact_with_mirror:
		for i in range(0, keys_to_check.size()):
			if Input.is_key_pressed(keys_to_check[i]):
				keys_pressed = i + 1

		frame = default_frame + keys_pressed

func _on_main_toggle_mirror_interaction() -> void:
	can_interact_with_mirror = not can_interact_with_mirror


func _on_main_end_dialogue() -> void:
	frame = 6
	can_interact_with_mirror = false
	print("yeehaw")
