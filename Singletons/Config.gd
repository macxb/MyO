extends Control


#TEMPORARY
const SAVE_PATH = "res://save.json"
var settings = {}
var play_Music = 1
var play_Effects = 1
var new_choice = 1
var song
var menu = true

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
	print(settings)
	_save_game()
	#_load_game()
#	_choose_music()
	_resolution()
	pass

#func _process(_delta):
#	if (!$streamPlayers/MenuMusicAudioStreamPlayer.is_playing()):
#		_choose_music()
#
#	if (Master_Volume > 0 and Music_Volume > 0):
#		play_Music = int((Master_Volume / 2000) * (Music_Volume / 2000) * 2000)
#	else:
#		play_Music = 1
#
#	if (Master_Volume > 0 and Effects_Volume > 0):
#		play_Effects = int((Master_Volume / 2000) * (Effects_Volume / 2000) * 2000)
#	else:
#		play_Effects = 1
#
#	$MenuMusicAudioStreamPlayer.set_max_distance(play_Music)
#	pass

func _resolution():
	ProjectSettings.set_setting("display/window/size/width", res_width)
	ProjectSettings.set_setting("display/window/size/height", res_height)
	OS.set_window_size(Vector2(res_width, res_height))
	pass

# LOAD

func _load_game():
	pass

func _on_LoadButton_pressed():
	_load_game()
	print("Load button was pressed!")
	pass

#SAVE

func _save_game():
# warning-ignore:shadowed_variable
	var settings = {
		resolution = {
			width = res_width,
			height = res_height
		},
		fullscreen = fullscreen,
		Master_Volume = Master_Volume,
		Music_Volume = Music_Volume,
		Effects_Volume = Effects_Volume,
		
		sp_use = sp_use,
		sp_pause = sp_pause
		
	}
	
	var save_file = File.new()
	save_file.open(SAVE_PATH, File.WRITE)
	save_file.store_line(to_json(settings))
	save_file.close()
	
	pass

func _on_SaveButton_pressed():
	_save_game()
	print("Save button was pressed!")
	pass


# MASTER VOLUME

func _on_MasterVolumeHSlider_value_changed(value):
	AudioServer.set_bus_volume_db(0, value)
	print ("Master Volume changed.")
	print ("value in db:", value)
	pass

func _on_SoundMuteCheckButton_toggled(_button_pressed):
		AudioServer.set_bus_mute(0, not AudioServer.is_bus_mute(0))
		pass

# MUSIC

func _on_MusicVolumeHSlider_value_changed(value):
	AudioServer.set_bus_volume_db(3, value)
	print ("Music Volume changed.")
	print ("value in db:", value)
	pass

func _on_MusicMuteCheckButton_toggled(_button_toggled):
		AudioServer.set_bus_mute(3, not AudioServer.is_bus_mute(3))
		pass
	
func _on_MusicSelectButton_item_selected(_id):
#	_choose_music()
	randomize()

	new_choice = int(rand_range(1,5))
	match new_choice:
		1:
			song = load("res://assets/audio/born_in_nexus.ogg")
		2:
			song = load("res://assets/audio/MyO_We_Are_Myriad.ogg")

	$root/streamPlayers/MenuMusicAudioStreamPlayer.set_stream(song)
	$root/streamPlayers/MenuMusicAudioStreamPlayer.play(0.0)
	pass 
	pass 

#func _choose_music():
#	if (menu == true):
#		_menu_music()
#	else:
#		_game_music()
#	pass
#
#func _menu_music():
#	randomize()
#
#	new_choice = int(rand_range(1,5))
#
#	match new_choice:
#		1:
#			song = load("res://assets/audio/born_in_nexus.ogg")
#		2:
#			song = load("res://assets/audio/MyO_We_Are_Myriad.ogg")
#
#	$streamPlayers/MenuMusicAudioStreamPlayer.set_stream(song)
#	$streamPlayers/MenuMusicAudioStreamPlayer.play(0.0)
#	pass
#
#func _game_music():
#	randomize()
#	new_choice = int(rand_range(1,5))
#
#	match new_choice:
#		1:
#			song = load("res://assets/audio/born_in_nexus.ogg")
#		2:
#			song = load("res://assets/audio/MyO_We_Are_Myriad.ogg")
#
#	$streamPlayers/MenuMusicAudioStreamPlayer.set_stream(song)
#	$streamPlayers/MenuMusicAudioStreamPlayer.play(0.0)
#	pass

#SFX

func _on_EffectsVolumeHSlider_value_changed(value):
	AudioServer.set_bus_volume_db(1, value)
	print ("Effects Volume changed.")
	print ("value in db:", value)
	pass

func _on_SFXMuteCheckButton_toggled(_button_toggled):
	AudioServer.set_bus_mute(1, not AudioServer.is_bus_mute(1))
	pass

# MYADCORE

func _on_MyadCoreVolumeHSlider_value_changed(value):
	AudioServer.set_bus_volume_db(3, value)
	print ("MYADCORE Volume changed.")
	print ("value in db:", value)
	pass

func _on_CoreMuteCheckButton_toggled(_button_toggled):
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
		
	
