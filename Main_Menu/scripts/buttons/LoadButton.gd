extends Button

signal loadbuttonpressed

func _on_LoadButton_pressed():
	print("Load button was pressed!")
	emit_signal("loadbuttonpressed")
