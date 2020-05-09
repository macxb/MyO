extends HSlider

func _ready():
	pass 

func _on_MyadCoreVolumeHSlider_value_changed(value):
	AudioServer.set_bus_volume_db(2, value)

func _on_CoreMuteCheckButton_toggled(_button_toggled):
		AudioServer.set_bus_mute(4, not AudioServer.is_bus_mute(4))
