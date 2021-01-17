extends Control

onready var is_fullscreen = false

func _full_screen_button():
	if !is_fullscreen:
		$Button.text = "Windowed Screen"
		is_fullscreen = true
	else: 
		$Button.text = "Full Screen (Recommended)"
		is_fullscreen = false
	OS.window_fullscreen = !OS.window_fullscreen

func _windowed_button():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	get_tree().change_scene("res://_main/main.tscn")
