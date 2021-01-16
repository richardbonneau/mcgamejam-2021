extends StaticBody

onready var player = self.get_owner().get_node("Player")

func talk_to():
	player.player_can_move = false
	self.get_owner().get_node("DialogueBox").talk(["hullo"])
