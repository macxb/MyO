extends Node


#TEMPORARY
const SAVE_PATH = "res://save.json"
var settings = { }

#SAVED

var Master_Volume = 10
var Music_Volume = 10
var Effects_Volume = 10
var sp_use = 32
var sp_pause = 16777217

var res_width = 1280
var res_height = 720
var fullscreen = false


func _ready():
	_load_game()
	print(settings)
	_save_game()
	pass

func _process(_delta):
	pass

# LOAD

func _load_game():
	print("Game loaded")
	pass

func _on_LoadButton_pressed():
	_load_game()
	print("Load button was pressed!")
	pass

#SAVE

func _save_game():
	print("game saved")
	pass

func _on_SaveButton_pressed():
	_save_game()
	print("Save button was pressed!")
	pass


# MASTER VOLUME

func _on_MasterVolumeHSlider_value_changed(value):
	AudioServer.set_bus_volume_db(0, value)
	_save_game()
	print ("Master Volume changed.")
	print ("value in db:", value)
	pass

func _on_SoundMuteCheckButton_toggled(_button_pressed):
		AudioServer.set_bus_mute(0, not AudioServer.is_bus_mute(0))
		pass

# MUSIC

func _on_MusicVolumeHSlider_value_changed(value):
	AudioServer.set_bus_volume_db(3, value)
	_save_game()
	print ("Music Volume changed.")
	print ("value in db:", value)
	pass

func _on_MusicMuteCheckButton_toggled(_button_pressed):
		AudioServer.set_bus_mute(3, not AudioServer.is_bus_mute(3))
		pass
	
#SFX

func _on_EffectsVolumeHSlider_value_changed(value):
	AudioServer.set_bus_volume_db(1, value)
	_save_game()
	print ("Effects Volume changed.")
	print ("value in db:", value)
	pass

func _on_SFXMuteCheckButton_toggled(_button_pressed):
	AudioServer.set_bus_mute(1, not AudioServer.is_bus_mute(1))
	pass

# MYADCORE

func _on_MyadCoreVolumeHSlider_value_changed(value):
	AudioServer.set_bus_volume_db(3, value)
	_save_game()
	print ("MYADCORE Volume changed.")
	print ("value in db:", value)
	pass

func _on_CoreMuteCheckButton_toggled(_button_pressed):
		AudioServer.set_bus_mute(4, not AudioServer.is_bus_mute(4))

# CANCEL

func _on_CancelButton_pressed():
	print("Cancel button was pressed!")
	# warning-ignore:return_value_discarded
	get_tree().change_scene("res://TitleScreen.tscn")
	pass

# RESET

func _on_ResetButton_pressed():
	print("Reset button was pressed!")
	pass
