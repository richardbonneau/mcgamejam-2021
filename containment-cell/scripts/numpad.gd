extends Spatial

onready var code_entered = ""
onready var main = self.get_owner()
onready var celldoor = main.get_node("Map/buildings/containment-cell/celldoor")

func button_press(btn):
	if !main.player_inventory.power_restored:
		main.get_node("DialogueBox").talk(main.player_messages.power_not_restored,false)
		return
	if btn == "erase":
		$wrong.play()
		code_entered = ""
	elif btn == "confirm":
		if code_entered == "1997":
			$success.play()
			celldoor.trigger_door()
		else:
			$erase.play()
			code_entered = ""
	else: 
		$beep.play()
		code_entered += btn
		print(code_entered)
 
