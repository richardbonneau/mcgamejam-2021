extends Spatial

onready var switch_open = true


func trigger_switch():
	print("SWITCH BAX", $switch.name)
	if switch_open:
		$switch.rotation.x = atan2(0, -0.7)
		switch_open = false
	else:
		$switch.rotation.x = atan2(0, 0.7)
		switch_open = true
	
