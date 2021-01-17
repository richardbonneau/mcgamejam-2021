extends KinematicBody

onready var door_opened = false
onready var trigger_open_door = false

onready var ending = false

var destination
var offset

func trigger_door():
	if !door_opened:
		var self_origin = get_global_transform().origin
		destination = Vector3(self_origin.x,self_origin.y,self_origin.z+2)
		
		trigger_open_door = true

func game_over():
	ending = true
	var self_origin = get_global_transform().origin
	destination = Vector3(self_origin.x,self_origin.y,self_origin.z-2)

func _physics_process(delta):
	if trigger_open_door:
		var self_origin = get_global_transform().origin
		offset = self_origin - destination
		var distance_to_dest = offset.length()
		print("distance_to_dest ",distance_to_dest)
		move_and_slide(offset.normalized() * 45 * delta)
		if distance_to_dest > 6.5: trigger_open_door = false
	
	if ending:
		var self_origin = get_global_transform().origin
		offset = self_origin - destination
		var distance_to_dest = offset.length()
		print("distance_to_dest ",distance_to_dest)
		move_and_slide(offset.normalized() * 45 * delta)
		if distance_to_dest > 6.5: 
			ending = false
			get_tree().change_scene("res://_menu/the_end.tscn")
	
