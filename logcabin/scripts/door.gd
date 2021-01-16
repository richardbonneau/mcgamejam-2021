extends KinematicBody

onready var door_opened = false

func trigger_door():
	if door_opened:
		rotation.y = atan2(0, -0.7)
		door_opened = false
	else:
		rotation.y = atan2(0, 0.7)
		door_opened = true
	
	
	
