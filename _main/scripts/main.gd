extends Spatial

func _on_DialogueBox_dialogue_exit():
	$Player.player_can_move = true
