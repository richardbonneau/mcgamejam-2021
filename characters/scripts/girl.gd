extends StaticBody

onready var main = self.get_owner()

func check_on_girl():
	main.get_node("DialogueBox").talk(main.player_messages.check_on_girl)
