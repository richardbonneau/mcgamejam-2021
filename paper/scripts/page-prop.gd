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
		"scp_report2": 
			text_on_page = "SCP-747 cannot speak, nor do they seem to be aware of humans unless taking particular interest in specific individuals. Mainly, SCP-747 shows interest in hand-made dolls and each other. It is unknown if SCP-747 has sentience, though they appear to be aware of their surroundings and will avoid walking into obstacles. SCP-747 is able to move through obstacles no thicker than ten (10) centimeters with ease. SCP-747 is also semi-corporeal; instances are able to lift and touch objects, but only for short periods of time before they tire."
			$page_ui/handwriting.visible = false
			$page_ui/typewriting.visible = true
		"scp_report1": 
			text_on_page = "All instances of --classified-- are to be contained in a room exactly thirty (30) metres by ten (10) metres, with walls consisting of concrete fifteen (15) centimetres thick. All instances of --classified-- are to be contained together in the same room. In the occurrence --classified-- shows interest in any personnel, Procedure ___-___-B9 must be performed immediately. Under no circumstances shall any unusual actions of --classified-- go unreported to personnel level 3 or higher."
			$page_ui/handwriting.visible = false
			$page_ui/typewriting.visible = true
		"cell_code":
			text_on_page = "It needed to be symbolic. I chose 1997 because it's the year that I lost my wife to my daughter's desease."
	$page_ui.visible = true
	$page_ui/handwriting.text = text_on_page
	$page_ui/typewriting.text = text_on_page

func _input(event):
	if reading and Input.is_action_pressed("ui_select"):
		$page_ui.visible = false
		player.player_can_move = true

