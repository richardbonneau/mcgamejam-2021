extends StaticBody


func talk_to():
	self.get_owner().get_owner().get_node("DialogueBox").talk(["hullo"])
