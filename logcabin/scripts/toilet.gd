extends StaticBody

onready var is_flushing = false
onready var water_coming_back_up = false
var water_origin
var water_destination
var offset

func flush():
	if !is_flushing:
		water_origin = $water.get_global_transform().origin
		water_destination = Vector3(water_origin.x,water_origin.y+2,water_origin.z)
		is_flushing = true

func _physics_process(delta):
	if is_flushing:
		var current_water_position = $water.get_global_transform().origin
		offset = current_water_position - water_destination
		var distance_to_dest = offset.length()
		
		if water_coming_back_up and distance_to_dest > 2:
			is_flushing = false
			water_coming_back_up = false
		
		if !water_coming_back_up and distance_to_dest > 2.5: 
			water_coming_back_up = true
			water_destination = Vector3(water_origin.x,water_origin.y-2,water_origin.z)
			
		$water.move_and_slide(offset.normalized() * 10 * delta)
