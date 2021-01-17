extends StaticBody

onready var main = self.get_owner()
onready var neighbour = main.get_node("Map/people/neighbour")
onready var player = main.get_node("Player")

func talk_to():
	player.player_can_move = false
	var dialogues
	for act in main.acts:
		if act.num == main.current_act and  !act.complete and act.character == "oldman":
			dialogues = act.dialogues
			if act.finishesAct: 
				act.complete = true
				main.current_act += 1
			if act.new_neighbour_coordinates:
				neighbour.global_transform.origin = act.new_neighbour_coordinates
			if act.neighbour_rotate:
				
				neighbour.rotation.y = 165
			break
	if dialogues: self.get_owner().get_node("DialogueBox").talk(dialogues,false)
	else: player.player_can_move = true
