extends Button

signal resetbuttonpressed


func _on_ResetButton_pressed():
	print("Reset button was pressed!")
	emit_signal("resetbuttonpressed")
	
