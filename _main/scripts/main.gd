extends Spatial

func _on_DialogueBox_dialogue_exit():
	print("dialogue exit")
	$Player.player_can_move = true
