extends Node

var MasterVolumeValue = AudioServer.get_bus_volume_db(0)

var path = "user://MyO_Game_Data.json"

# The default values
var default_data = {
	"player_stats" : {
		"name" : "MyO",
		},
	"audio_options" : {
		"MasterVolumeValue" : -24,
		},
}
var data = { }


func _ready():
	load_game()
	

func load_game():
	var file = File.new()
	
	if not file.file_exists(path):
		reset_data()
		return
	
	file.open(path, file.READ)
	var text = file.get_as_text()
	data = parse_json(text)
	file.close()


func save_game():
	var file
	
	file = File.new()
	file.open(path, File.WRITE)
	file.store_line(to_json(data))
	file.close()


func reset_data():
	data = default_data.duplicate(true)

func _on_SaveButton_savebuttonpressed():
	print("Save button signal was recieved!")
	print("Saving Game...")
	save_game()

func _on_LoadButton_loadbuttonpressed():
	load_game()
	print("Load button signal was recieved!")
	print("Loading Game...")

func _on_ResetButton_resetbuttonpressed():
	print("Reset button signal was recieved!")
	print("Reseting Game...")
	
	# Delete file
	var dir = Directory.new()
	dir.remove(path)
	reset_data()
