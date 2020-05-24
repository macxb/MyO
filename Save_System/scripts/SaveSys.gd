extends Node

signal savebuttonpressed


func _ready():
	pass # Replace with function body.


func _on_SaveButton_pressed():
	print("Save button was pressed!")
	emit_signal("savebuttonpressed")
