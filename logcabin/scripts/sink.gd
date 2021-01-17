extends StaticBody

func trigger_sink():
	if $water.visible == false: $water.visible = true
	else: $water.visible = false
