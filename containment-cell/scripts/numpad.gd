extends Spatial

onready var code_entered = ""
onready var celldoor = self.get_owner().get_node("Map/buildings/containment-cell/celldoor")

func button_press(btn):
	if btn == "erase":
		$erase.play()
		code_entered = ""
	elif btn == "confirm":
		if code_entered == "12":
			$success.play()
			celldoor.trigger_door()
		else:
			$wrong.play()
			code_entered = ""
	else: 
		$beep.play()
		code_entered += btn
		print(code_entered)
