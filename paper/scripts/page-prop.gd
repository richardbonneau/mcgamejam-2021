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
		"dont_touch": 
			text_on_page = "DO NOT!! SHUT THE POWER DOWN UNDER ANY CIRCUMSTANCE"
			$page_ui/handwriting.visible = true
			$page_ui/typewriting.visible = false
		"daughter_help": 
			text_on_page = "Daddy is keeping us here. He says it's for our own good. Mommy tried to fight him off but she is weaker every day. I want to go see my friends, I don't like it here it is too dark and I feel funny."
			$page_ui/handwriting.visible = true
			$page_ui/typewriting.visible = false
		"scp_report1": 
			text_on_page = "All instances of --classified-- are to be contained in a room exactly thirty (30) metres by ten (10) metres, with walls consisting of concrete fifteen (15) centimetres thick. All instances of --classified-- are to be contained together in the same room. In the occurrence --classified-- shows interest in any personnel, Procedure ___-___-B9 must be performed immediately. Under no circumstances shall any unusual actions of --classified-- go unreported to personnel level 3 or higher."
			$page_ui/handwriting.visible = false
			$page_ui/typewriting.visible = true
	$page_ui.visible = true
	$page_ui/handwriting.text = text_on_page
	$page_ui/typewriting.text = text_on_page

func _input(event):
	if reading and Input.is_action_pressed("ui_select"):
		$page_ui.visible = false
		player.player_can_move = true

