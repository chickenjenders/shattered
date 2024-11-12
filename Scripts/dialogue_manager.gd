extends Node

@export var text_box: MarginContainer

var dialog_lines: Array[String] = [
		"Me: OH MY GOD! I look worse than I thought. I'm horrifying, what should I do?",
		"Store Clerk: Don't worry, we can fix you right up! Let's start with your lips, they look a bit dry. Press and hold 'S' to apply some lip moisturizer.",
		"Me: Wow, I guess it's better? No, it might be worse.",
		"Store Clerk: No, no! It's definitely better! Press and hold 'C' to try this skin cream to brighten your complexion.",
		"Me: Something looks wrong here.",
		"Store Clerk: It's such an improvement! Maybe a bit more for the skin? Press and hold 'D' to apply powder for evening out your skint tone.",
		"Me: I'm pretty sure I've seen an animatronic that looks like this in the Halloween store.",
		"Store Clerk: No, way! You're so stunning! We need to bring more attention to your eyes. Press and hold 'F' to try this eye cream to make them pop!",
		"Me: Well, you werent lying. Do I really look better?",
		"Store Clerk: Of course! These are the best and most popular products out there. You just can't live without them! That goes for our clothes too, here press 'SPACE' to switch to this new top we just got in!",
		"Me: All of these things are pretty expensive.",
		"Store Clerk: Well, you know what they say about quality of products. Speaking of, one last thing! You NEED this matching bag, your outfit just isn't complete without it! Press and hold 'Q' to try on.",
		"Me: Do I really need all this to be considered beautiful? It's just too much, and it will never be enough anyway. I think its all just about profiting off my insecurities. I don't even think I look any different. Sigh, let's go home and eat a sweet treat.",
	]
var current_line_index = 0

signal toggle_mirror_interaction

signal end_dialogue

var text_box_position: Vector2

var is_dialog_active = false

func _ready():
	# Wait until the text_box is assigned
	while text_box == null:
		await get_tree().process_frame
	start_dialog()

func start_dialog():
	if is_dialog_active:
		return

	_show_text_box()

	is_dialog_active = true

func _show_text_box():
	text_box.display_text(dialog_lines[current_line_index])

func _unhandled_input(event):
	if (
		event.is_action_pressed("advance_dialogue") &&
		is_dialog_active
	):
		
		current_line_index += 1
		if current_line_index == 1:
			toggle_mirror_interaction.emit()
		if current_line_index == dialog_lines.size() - 1:
			end_dialogue.emit()
			is_dialog_active = false
	
		_show_text_box()
