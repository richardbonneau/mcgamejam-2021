extends StaticBody

onready var main = self.get_owner()
onready var oldman = main.get_node("Map/people/oldman")
onready var player = main.get_node("Player")

func talk_to():
	player.player_can_move = false
	var dialogues
	for act in main.acts:
		if act.num == main.current_act and !act.complete and act.character == "neighbour":
			dialogues = act.dialogues
			if act.finishesAct: 
				act.complete = true
				main.current_act += 1
			if act.new_oldman_coordinates:
				oldman.global_transform.origin = act.new_oldman_coordinates
			break
	if dialogues: self.get_owner().get_node("DialogueBox").talk(dialogues)
	else: player.player_can_move = true
