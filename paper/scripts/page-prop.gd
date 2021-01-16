extends StaticBody

export(String) var subject = "blank" 
onready var player = self.get_owner().get_node("Player")
onready var reading = false
func read_page():
	reading = true
	player.player_can_move = false
	var text_on_page = ""
	match subject:
		"blank": text_on_page = ""
		"dont_touch": text_on_page = "DO NOT!! SHUT THE POWER DOWN UNDER ANY CIRCUMSTANCE"
		"daughter_help": text_on_page = "Daddy is keeping us here. He says it's for our own good. Mommy tried to fight him off but she is weaker every day. I want to go see my friends, I don't like it here it is too dark and I feel funny."
	$page_ui.visible = true
	$page_ui/Label.text = text_on_page

func _input(event):
	if reading and Input.is_action_pressed("ui_select"):
		$page_ui.visible = false
		player.player_can_move = true

