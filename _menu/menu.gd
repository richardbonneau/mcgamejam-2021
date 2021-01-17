extends Control

func _full_screen_button():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	OS.window_fullscreen = !OS.window_fullscreen
	get_tree().change_scene("res://_main/main.tscn")


func _windowed_button():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	get_tree().change_scene("res://_main/main.tscn")
