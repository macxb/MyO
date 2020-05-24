extends Control

signal loadbuttonpressed
signal resetbuttonpressed
signal savebuttonpressed

func _on_Button_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://TitleScreen.tscn")

func _on_MusicSelectButton_ready():
	pass # Replace with function body.
	
func _on_MusicSelectButton_idOne():
	print ("We are Myriad selected")

func _on_MusicSelectButton_idTwo():
	print ("Born in Nexus selected")

func _on_LoadButton_pressed():
	print("Load button was pressed!")
	emit_signal("loadbuttonpressed")

func _on_SaveButton_pressed():
	print("Save button was pressed!")
	emit_signal("savebuttonpressed")

func _on_ResetButton_pressed():
	print("Reset button was pressed!")
	emit_signal("resetbuttonpressed")
	
func _on_CancelButton_pressed():
	print("Cancel button was pressed!")
	# warning-ignore:return_value_discarded
	get_tree().change_scene("res://TitleScreen.tscn")
	
