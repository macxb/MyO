extends ConfigFile


var err = config.load("user://settings.cfg")

func _ready():
	pass 

if err == OK: 
	# If not, something went wrong with the file loading
	# Look for the display/width pair, and default to 1024 if missing
	
	var screen_width = config.get_value("display", "width", 1024)
	
	# Store a variable if and only if it hasn't been defined yet
	if not config.has_section_key("audio", "mute"):
		config.set_value("audio", "mute", false)
	
	# Save the changes by overwriting the previous file
	config.save("user://settings.cfg")
