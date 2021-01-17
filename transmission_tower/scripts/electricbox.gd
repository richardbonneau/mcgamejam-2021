extends Spatial

onready var main = self.get_owner()
onready var switch_open = true
onready var steps = 0


func trigger_switch():
	print("main ",main)
	if !main.player_inventory.electricbox_key:
		main.get_node("DialogueBox").talk(main.player_messages.electricbox_nokey,false)
	elif main.player_inventory.electricbox_key_2 and steps < 2:
		steps+=1
		if switch_open:
			$switch.rotation.x = atan2(0, -0.7)
			switch_open = false
		else:
			$switch.rotation.x = atan2(0, 0.7)
			switch_open = true
		if steps == 2:
			main.current_act = 5

