# Grab ability with E (works on rigid bodies only), throw it with the left click

extends RayCast

onready var ShootRayCast = get_tree().get_root().find_node("ShootRayCast", true, false)

func _physics_process(delta):
	if is_colliding():
		var collider_name = get_collider().name
		var hud_text = ""
		
		match collider_name:
			"door":hud_text = "Open Door"
			"electricbox": hud_text = "Trigger Power Switch"
			"oven_element": hud_text = "Use Oven"
			"oven_element2": hud_text = "Use Oven"
			"oven_element3": hud_text = "Use Oven"
			"oven_element4": hud_text = "Use Oven"
			"page":hud_text = "Read"
		
		$crosshair/text.text = hud_text
		$crosshair.visible = true
	else:
		$crosshair.visible = false
	

func _input(event):
	if event is InputEventMouseButton: # If we grab and object and press the left click, we throw it
		if event.button_index == BUTTON_LEFT and event.is_pressed():
			if is_colliding():
				var collider_name = get_collider().name
				
				match collider_name:
					"door": 
						get_collider().trigger_door()
						
					"electricbox": get_collider().trigger_switch()
					"celldoor": get_collider().trigger_door()
					"oven_element": get_collider().trigger_element()
					"oven_element2": get_collider().trigger_element()
					"oven_element3": get_collider().trigger_element()
					"oven_element4": get_collider().trigger_element()
					"page": get_collider().read_page()
					
				
				
#				self.get_owner().get_owner().get_node("DialogueBox").talk(["hello","object_grabbed:object_grabbed.set_mode(0)object_grabbed.linear_velocity = global_transform.basis.z * -throw_forceobject_grabbed = false"])
