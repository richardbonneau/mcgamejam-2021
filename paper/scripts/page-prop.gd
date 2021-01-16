extends StaticBody

export(String) var subject = "blank" 
onready var player = self.get_owner().get_node("Player")
func read_page():
	player.player_can_move = false
	var text_on_page = ""
	match subject:
		"blank": text_on_page = ""
		"dont_touch": text_on_page = "Do not turn the power off, under any circumstance."
	$page_ui.visible = true
	$page_ui/Label.text = text_on_page

func _input(event):
	if Input.is_action_pressed("ui_select"):
		$page_ui.visible = false
		player.player_can_move = true

