# Grab ability with E (works on rigid bodies only), throw it with the left click

extends RayCast

onready var ShootRayCast = get_tree().get_root().find_node("ShootRayCast", true, false)

func _physics_process(delta):
	if is_colliding():
		var collider_name = get_collider().name
		var hud_text = ""
		
		$crosshair.visible = true
		match collider_name:
			"door":hud_text = "Use Door"
			"electricbox": hud_text = "Trigger Power Switch"
			"key": hud_text = "Pick up Key"
			"key2": hud_text = "Pick up Key"
			"key3": hud_text = "Pick up Electronic Key"
			"key4": hud_text = "Pick up Key"
			"safedoor": hud_text = "Open Safe"
			
			
			"oven_element": hud_text = "Use Oven"
			"oven_element2": hud_text = "Use Oven"
			"oven_element3": hud_text = "Use Oven"
			"oven_element4": hud_text = "Use Oven"
			"toilet": hud_text = "Flush"
			"toilet2": hud_text = "Flush"
			"sink": hud_text = "Use Sink"
			"sink2": hud_text = "Use Sink"
			
			"page":hud_text = "Read"
			"page2":hud_text = "Read"
			"page3":hud_text = "Read"
			"page4":hud_text = "Read"
			"page5":hud_text = "Read"
			
			"oldman": hud_text = "Talk to Old Man"
			"neighbour": hud_text = "Talk to Neighbour"
			"girl": hud_text = "Sleeping Girl"
			
			"button0": hud_text = "0"
			"button1": hud_text = "1"
			"button2": hud_text = "2"
			"button3": hud_text = "3"
			"button4": hud_text = "4"
			"button5": hud_text = "5"
			"button6": hud_text = "6"
			"button7": hud_text = "7"
			"button8": hud_text = "8"
			"button9": hud_text = "9"
			"buttonok": hud_text = "Confirm"
			"buttoncancel": hud_text = "Erase"
			"exit": hud_text = "Leave?"
			
			"doll": hud_text = "Doll"
			"doll2": hud_text = "Doll"
			"doll3": hud_text = "Doll"
			"doll4": hud_text = "Doll"
			"doll5": hud_text = "Doll"
			"doll6": hud_text = "Doll"
			"doll7": hud_text = "Doll"
			"doll8": hud_text = "Doll"
			"doll9": hud_text = "Doll"
			"doll10": hud_text = "Doll"
			"doll11": hud_text = "Doll"
			"doll13": hud_text = "Doll"
			"doll14": hud_text = "Doll"
			"doll15": hud_text = "Doll"
			"doll16": hud_text = "Doll"
			"doll17": hud_text = "Doll"
			"doll18": hud_text = "Doll"
			"doll19": hud_text = "Doll"
			_: $crosshair.visible = false
		
		$crosshair/text.text = hud_text
		
	else:
		$crosshair.visible = false
	



func _input(event):
	if self.get_owner().player_can_move == false: return
	if event is InputEventMouseButton: # If we grab and object and press the left click, we throw it
		if event.button_index == BUTTON_LEFT and event.is_pressed():
			if is_colliding():
				var collider_name = get_collider().name
				print(collider_name)
				match collider_name:
					"door": 
						get_collider().trigger_door()
						
					"electricbox": get_collider().trigger_switch()
					"celldoor": get_collider().trigger_door()
					"key": get_collider().pickup_key()
					"key2": get_collider().pickup_key()
					"key3": get_collider().pickup_key()
					"key4": get_collider().pickup_key()
					"safedoor": get_collider().open_door()
					"exit": get_collider().trying_to_leave()
					
					"oven_element": get_collider().trigger_element()
					"oven_element2": get_collider().trigger_element()
					"oven_element3": get_collider().trigger_element()
					"oven_element4": get_collider().trigger_element()
					"toilet": get_collider().flush()
					"toilet2": get_collider().flush()
					"sink": get_collider().trigger_sink()
					"sink2": get_collider().trigger_sink()
					
					"page": get_collider().read_page()
					"page2": get_collider().read_page()
					"page3": get_collider().read_page()
					"page4": get_collider().read_page()
					"page5": get_collider().read_page()
					
					"oldman": get_collider().talk_to()
					"neighbour": get_collider().talk_to()
					"girl": get_collider().check_on_girl()
					
					"button0": get_collider().get_owner().button_press("0")
					"button1": get_collider().get_owner().button_press("1")
					"button2": get_collider().get_owner().button_press("2")
					"button3": get_collider().get_owner().button_press("3")
					"button4": get_collider().get_owner().button_press("4")
					"button5": get_collider().get_owner().button_press("5")
					"button6": get_collider().get_owner().button_press("6")
					"button7": get_collider().get_owner().button_press("7")
					"button8": get_collider().get_owner().button_press("8")
					"button9": get_collider().get_owner().button_press("9")
					"buttonok": get_collider().get_owner().button_press("confirm")
					"buttoncancel": get_collider().get_owner().button_press("erase")
					
					"doll": get_collider().its_a_human_doll()
					"doll2": get_collider().its_a_human_doll()
					"doll3": get_collider().its_a_human_doll()
					"doll4": get_collider().its_a_human_doll()
					"doll5": get_collider().its_a_human_doll()
					"doll6": get_collider().its_a_human_doll()
					"doll7": get_collider().its_a_human_doll()
					"doll8": get_collider().its_a_human_doll()
					"doll9": get_collider().its_a_human_doll()
					"doll10": get_collider().its_a_human_doll()
					"doll11": get_collider().its_a_human_doll()
					"doll13":get_collider().its_a_human_doll()
					"doll14": get_collider().its_a_human_doll()
					"doll15":get_collider().its_a_human_doll()
					"doll16": get_collider().its_a_human_doll()
					"doll17": get_collider().its_a_human_doll()
					"doll18": get_collider().its_a_human_doll()
					"doll19": get_collider().its_a_human_doll()
