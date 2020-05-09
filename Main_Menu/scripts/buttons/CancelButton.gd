extends Button



func _on_CancelButton_pressed():
	print("Cancel button was pressed!")
	# warning-ignore:return_value_discarded
	get_tree().change_scene("res://TitleScreen.tscn")
