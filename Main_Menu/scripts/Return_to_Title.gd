extends Node

export(String) var scene_to_load

func _on_Button_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://TitleScreen.tscn")

func _on_ExitExitButton_pressed():
		get_tree().quit()

