extends CheckButton


func _on_FullScreenToggle_ready():
	pass
	
func _on_FullScreenToggle_toggled(_button_toggled):
	OS.window_fullscreen = !OS.window_fullscreen
	print("Window Fullscreen Toggled")
