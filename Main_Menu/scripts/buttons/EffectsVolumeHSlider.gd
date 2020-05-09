extends HSlider

# Called when the node enters the scene tree for the first time.
func _ready():
	pass 

func _on_EffectsVolumeHSlider_value_changed(value):
	AudioServer.set_bus_volume_db(1, value)


func _on_SFXMuteCheckButton_toggled(_button_toggled):
		AudioServer.set_bus_mute(1, not AudioServer.is_bus_mute(1))
