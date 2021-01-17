extends Spatial

onready var main = self.get_owner().get_owner()
onready var door_opened = false

func open_door():
	if !main.player_inventory.safe_key:
		main.get_node("DialogueBox").talk(main.player_messages.safe_nokey,false)
	elif !door_opened:
		rotation.y = atan2(-0.5, 0)
		door_opened = true


#func trigger_door():
#	if self.get_owner().is_neighbour_house and !main.player_inventory.neighbour_house_key:
#		main.get_node("DialogueBox").talk(main.player_messages.door_locked,false)
#		return
#
#	if !door_opened:
#		rotation.y = atan2(0, -0.7)
#		door_opened = true
#	else:
#		rotation.y = atan2(0, 0.7)
#		door_opened = false
#
	
