extends Control

var FullScreenToggle = ("res://Main_Menu/scenes/buttons/FullScreenToggle.tscn")

# need to develope this into code that will set the toggles 
# apearance ocording to weather the game is in fullscreen or not

#func _on_ConfigScreen_ready():
#	OS.window_fullscreen = not OS.window_fullscreen
#	if OS.is_window_fullscreen():
#		FullScreenToggle.set_toggle_mode(2)

func _on_Button_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://TitleScreen.tscn")

func _on_MusicSelectButton_ready():
	pass # Replace with function body.
	
func _on_MusicSelectButton_idOne():
	print ("We are Myriad selected")
	pass

func _on_MusicSelectButton_idTwo():
	print ("Born in Nexus selected")
	pass

