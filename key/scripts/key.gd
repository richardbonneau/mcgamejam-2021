extends StaticBody

onready var main = self.get_owner()


export(String) var key_type = "blank"

func pickup_key():
	main.get_node("DialogueBox").talk(main.player_messages.found_electricbox_key)
	main.player_inventory.electricbox_key = true
	main.get_node("Map/people/neighbour").global_transform.origin = Vector3(35,0.2,-4)
	self.queue_free()
