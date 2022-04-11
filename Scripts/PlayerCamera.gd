extends Camera2D


func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_WHEEL_UP and event.pressed:
			zoom.x -= 0.1
			zoom.y -= 0.1
		if event.button_index == BUTTON_WHEEL_DOWN and event.pressed:
			zoom.x += 0.1
			zoom.y += 0.1
