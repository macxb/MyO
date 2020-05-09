extends HSlider

func _ready():
	pass 


func _on_MusicVolumeHSlider_value_changed(value):
	AudioServer.set_bus_volume_db(3, value)


func _on_MusicMuteCheckButton_toggled(_button_toggled):
		AudioServer.set_bus_mute(3, not AudioServer.is_bus_mute(3))



