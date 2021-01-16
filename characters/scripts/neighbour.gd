extends StaticBody


func talk_to(player):
	player.player_can_move = false
	self.get_owner().get_node("DialogueBox").talk(["hullo"])
