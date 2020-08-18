extends HSlider

func _ready():
	pass 

func _on_MasterVolumeHSlider_value_changed(value):
	AudioServer.set_bus_volume_db(0, value)
	emit_signal("mastervolumevalue")

func _on_MasterVolumeHSlider_mastervolumevalue():
	print ("Master Volume changed.")
	print ("value in db:", value)
