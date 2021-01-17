extends StaticBody


func trying_to_leave():
	self.get_owner().get_node("DialogueBox").talk(self.get_owner().player_messages.trying_to_leave,false)
