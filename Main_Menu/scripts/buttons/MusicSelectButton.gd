extends Control

signal idOne
signal idTwo

func _on_MusicSelectButton_ready():
	pass 

func _on_MusicSelectButton_item_selected_one(_id: = 1):
	emit_signal("idOne")
	pass 

func _on_MusicSelectButton_item_selected_two(_id: = 2):
	emit_signal("idTwo")
	pass 


