extends StaticBody


func its_a_human_doll():
	self.get_owner().get_node("DialogueBox").talk(self.get_owner().player_messages.its_a_human_doll,false)
