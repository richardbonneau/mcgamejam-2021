extends StaticBody

onready var main = self.get_owner()

export(String) var key_type = "blank"

func _ready():
	if key_type == "safe":
		$regular.visible = false
		$electronic.visible = true

func pickup_key():
	if key_type == "electricbox_key":
		main.get_node("DialogueBox").talk(main.player_messages.found_electricbox_key,false)
		main.player_inventory.electricbox_key = true
		main.get_node("Map/people/neighbour").global_transform.origin = Vector3(35,0.2,-4)
	elif key_type == "neighbour_house_key":
		main.get_node("DialogueBox").talk(main.player_messages.found_neighbour_house_key,false)
		main.player_inventory.neighbour_house_key = true
	elif key_type == "safe":
		main.get_node("DialogueBox").talk(main.player_messages.found_electronic_key,false)
		main.player_inventory.safe_key = true
	elif key_type == "electricbox_key_2":
		main.get_node("DialogueBox").talk(main.player_messages.found_electricbox_key_2,false)
		main.player_inventory.electricbox_key_2 = true
	self.queue_free()

