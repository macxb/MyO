extends TextureRect

var default_URL = "https://darkorbit.com"


func _on_Logo_gui_input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
# warning-ignore:return_value_discarded
		OS.shell_open(default_URL);
