extends AnimatedSprite2D

var keys_to_check = [KEY_SPACE, KEY_A, KEY_S, KEY_D]  # Add the keys you want to check
var default_frame = 0  # Set this to your default frame index

func _ready():
	frame = default_frame

func _process(delta):
	var keys_pressed = 0
	
	for key in keys_to_check:
		if Input.is_key_pressed(key):
			keys_pressed += 1
	
	if keys_pressed > 0:
		frame = default_frame + keys_pressed
	else:
		frame = default_frame
