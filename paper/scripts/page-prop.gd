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
		"scp_report3": 
			text_on_page = "SCP-747 has the ability to transform humans into dolls over the course of approximately twenty-one (21) days. To do this, instances of SCP-747 surround the human and hold hands before walking around the human for a period of five (5) to seven (7) seconds. Afterwards, SCP-747 disperses and continues normal behavior. It is unknown which humans they choose to transform or why. SCP-747 occasionally shows interest in a person before attempting to transform them. The person is able to interrupt the process by moving away or avoiding SCP-747; however, most people describe a feeling of 'thoughtlessness' or 'blankness' when in contact with SCP-747, thereby making the interruption difficult."
			$page_ui/handwriting.visible = false
			$page_ui/typewriting.visible = true
		"scp_report2": 
			text_on_page = "SCP-747 cannot speak, nor do they seem to be aware of humans unless taking particular interest in specific individuals. Mainly, SCP-747 shows interest in hand-made dolls and each other. It is unknown if SCP-747 has sentience, though they appear to be aware of their surroundings and will avoid walking into obstacles. SCP-747 is able to move through obstacles no thicker than ten (10) centimeters with ease. SCP-747 is also semi-corporeal; instances are able to lift and touch objects, but only for short periods of time before they tire."
			$page_ui/handwriting.visible = false
			$page_ui/typewriting.visible = true
		"scp_report1": 
			text_on_page = "All instances of --classified-- are to be contained in a room exactly thirty (30) metres by ten (10) metres, with walls consisting of concrete fifteen (15) centimetres thick. All instances of --classified-- are to be contained together in the same room. In the occurrence --classified-- shows interest in any personnel, Procedure ___-___-B9 must be performed immediately. Under no circumstances shall any unusual actions of --classified-- go unreported to personnel level 3 or higher."
			$page_ui/handwriting.visible = false
			$page_ui/typewriting.visible = true
		"cell_code":
			self.get_owner().get_node("Map/buildings/numpad").code_entered = ""
			$page_ui/handwriting.visible = true
			$page_ui/typewriting.visible = false
			text_on_page = "It needed to be symbolic. I chose 1997 because it's the year that I lost my wife to my daughter's desease."
	$page_ui.visible = true
	$page_ui/handwriting.text = text_on_page
	$page_ui/typewriting.text = text_on_page

func _input(event):
	if reading and Input.is_action_pressed("ui_select"):
		$page_ui.visible = false
		player.player_can_move = true

