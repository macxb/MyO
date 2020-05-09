extends Control

var following = false
var mouse_offset
var window_position
var window_size
var distance_to_edge
export (bool) var left = false
export (bool) var vertical = true

func _ready():
	if vertical:
		distance_to_edge = OS.window_size.y - rect_global_position.y
	else:
		if left:
			distance_to_edge = rect_global_position.x
		else:
			distance_to_edge = rect_global_position.x - OS.window_size.x
			
func _on_WindowVResizeControl_gui_input(event):
	if event is InputEventMouseButton:
		if event.get_button_index() == 1:
			mouse_offset = get_local_mouse_position()
			window_position = OS.window_position
			window_size = OS.window_size
			following = !following
			
func _process(_delta):
	if following:
		if vertical:
			OS.window_size.y = get_global_mouse_position().y + distance_to_edge - mouse_offset.y
			rect_position.y = OS.window_size.y - distance_to_edge
		else:
			if left:
				OS.window_position.x = (OS.window_position + get_global_mouse_position() - mouse_offset).x - distance_to_edge
				OS.window_size.x = window_size.x + (window_position.x - OS.window_position.x)
			else:
				OS.window_size.x = get_global_mouse_position().x + distance_to_edge - mouse_offset.x
	if vertical == false and left == false:
		rect_global_position.x = OS.window_size.x + distance_to_edge
		
