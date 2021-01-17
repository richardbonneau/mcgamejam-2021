extends StaticBody

onready var main = self.get_owner()

func check_on_girl():
	main.get_node("DialogueBox").talk(main.player_messages.check_on_girl,false)
	main.get_node("Map/people/neighbour").global_transform.origin = Vector3(57.3,0,13)
	main.get_node("Map/buildings/containment-cell/end_game").global_transform.origin = Vector3(58.7,0,13)
	main.current_act = 6
