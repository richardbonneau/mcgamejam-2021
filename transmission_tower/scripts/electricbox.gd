extends Spatial

onready var main = self.get_owner()
onready var switch_open = true


func trigger_switch():
	print("main ",main)
	if !main.player_inventory.electricbox_key:
		main.get_node("DialogueBox").talk(main.player_messages.electricbox_nokey)
#	print("SWITCH BAX", $switch.name)
#	if switch_open:
#		$switch.rotation.x = atan2(0, -0.7)
#		switch_open = false
#	else:
#		$switch.rotation.x = atan2(0, 0.7)
#		switch_open = true
#
