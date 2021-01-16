extends StaticBody

var oven_on = false
var black = "#232528"
var red = "#8A0303"
func trigger_element():
	if oven_on:
		$model.get_surface_material(0).albedo_color = black
		oven_on = false
	else:
		$model.get_surface_material(0).albedo_color = red
		oven_on = true
	
