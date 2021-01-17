extends StaticBody

func trigger_sink():
	if $water.visible == false: 
		$water.visible = true
		$audio.play()
	else: 
		$water.visible = false
		$audio.stop()
