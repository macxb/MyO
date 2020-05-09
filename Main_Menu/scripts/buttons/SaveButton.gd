extends Node

signal savebuttonpressed

func _on_SaveButton_pressed():
	print("Save button was pressed!")
	emit_signal("savebuttonpressed")
