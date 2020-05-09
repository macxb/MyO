extends HSlider

signal mastervolumevalue

func _ready():
	pass 

func _on_MasterVolumeHSlider_value_changed(value):
	AudioServer.set_bus_volume_db(0, value)
	emit_signal("mastervolumevalue")

func _on_MuteCheckButton_toggled(_button_toggled):
		AudioServer.set_bus_mute(0, not AudioServer.is_bus_mute(0))

func _on_MasterVolumeHSlider_mastervolumevalue():
	print ("Master Volume changed.")
	print ("value in db:", value)
