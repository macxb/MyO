# Myriad: Origins (MyO)
<a href="https://godotengine.org" target="_new"><img src="https://img.shields.io/badge/godot-v3.3-%23478cbf" alt="GODOT GAME ENGINE" border="1" /></a>
<a href="https://img.shields.io/badge/online%20life-100%25-green" target="_new"><img src="https://img.shields.io/badge/online%20life-100%25-green" alt="online life" border="1" /></a>
<a href="https://img.shields.io/badge/Fairplay-100%25-green" target="_new"><img src="https://img.shields.io/badge/Fairplay-100%25-green" alt="GODOT GAME ENGINE" border="1" /></a>
[![ko-fi](https://www.ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/W7W21C3X1)

<img src="https://cdn.discordapp.com/attachments/354584610023276545/689573924895588399/unknown.png" 
alt="Menu image 1.4.0.a" width="1080" height="500" border="5" />

This games’ main aim is to give a total gaming experience by providing all types of GamePlay with different Game Type Modules (GTMs) in one game within a commonly themed universe, Scoreboard for each GTM and an overall Game scoreboard (Top).
This will allow Gamers to become proficient in the GTMs of their choice or in all of them. Gamers now look to escape “enslaving” Gameplay and we want to help them do that!

### InGame Music by 

## Backstory
* When Mars was finally colonised in 2030 we hoped for a new start. A new world, a new way.
* Under the 2025 United Mars Treaty no colonisation of any part of Mars could take place in the name of a single Terran country.
* In 2045 the Mars Interim Committee was disbanded & the Mars Government Union was instituted.
* In 2050 the MGU was granted full authority & independence over Martian Planetary & aerospace affairs.
* In 2061 MGU formally petitioned full authority over Martian Spatial Territory which was denied by Terran authorities causing the blockade of metal exports from Mars by Martian authorities creating a financial crash on earth.  This led to an interplanetary dispute which resulted in the Mars Unilateral Agreement, a declaration of total independence from the earth.
* We prepared for war; we had practice, killing our own...
* Then the [Race 2] arrived & sat, without communication or movement, on the outskirts of the Sol system & we continued preparing for war. Against a different enemy.
* Both Earth & Mars united against this perceived common enemy.
* Before contact was even made, war was prepared.  The alien race sent repeated scout ships, never communicating, never interacting. 
* The first Human space fleet was assembled & began its journey towards the alien armada, vastly outnumbered & towards almost certain defeat.
* When an alien scout passing close to a mining asteroid explosion rescued all surviving humans and left them in the nearest human outpost. The Human race paused, the fleet was ordered to halt and remain in place.
* The interplanetary social networks were aflame! The public demand for attempts at communication with the now popularly called “visitors” grew.  The crew of the alien scout were proclaimed heroes by the public, even without knowing anything about them.
* Then the same scout returned from its fleet & stopped in Terran geosynchronous orbit, above the middle of the Atlantic Ocean. 
* A single message was received: “Permission to land.”

### Overview 
* In the recent past the earth has finally made contact with aliens.
* Then with a galaxy destroying disaster in another galaxy, caused by a war between two of the galaxies’ races. A system of Clans was formally instituted and Clan sizes were limited.
* War above Clan level was forbidden in all known galaxies.
* Race & origin lost importance and Clan became paramount.

### Code
```gdscript
extends Control

#KEYBIND MENU
#TODO IMPLEMENT KEYBIND MENU

var can_change_key = false
var action_string
enum ACTIONS {JUMP, CROUCH, LEFT, RIGHT, FORWARD, BACK, ROLL}


func _ready():
	_set_keys()


func _set_keys():
	for j in ACTIONS:
		get_node("/root/ConfigScreen/KeybindControl/KeybindHBoxContainer/MovementVBoxContainer/HBoxContainer/VBoxContainer/HBoxContainer_" + str(j) + "/Button").set_pressed(false)
		if !InputMap.get_action_list(j).empty():
			get_node("/root/ConfigScreen/KeybindControl/KeybindHBoxContainer/MovementVBoxContainer/HBoxContainer/VBoxContainer/HBoxContainer_" + str(j) + "/Button").set_text(InputMap.get_action_list(j)[0].as_text())
		else:
			get_node("/root/ConfigScreen/KeybindControl/KeybindHBoxContainer/MovementVBoxContainer/HBoxContainer/VBoxContainer/HBoxContainer_" + str(j) + "/Button").set_text("No Button!")


func b_change_key_LEFT():
	_mark_button("LEFT")
	save()

func b_change_key_RIGHT():
	_mark_button("RIGHT")
	save()

func b_change_key_FORWARD():
	_mark_button("FORWARD")
	save()

func b_change_key_BACK():
	_mark_button("BACK")
	save()

func b_change_key_JUMP():
	_mark_button("JUMP")
	save()

func b_change_key_CROUCH():
	_mark_button("CROUCH")
	save()
	
func b_change_key_ROLL():
	_mark_button("ROLL")
	save()

func _mark_button(string):
	can_change_key = true
	action_string = string
	
	for j in ACTIONS:
		if j != string:
			get_node("/root/ConfigScreen/KeybindControl/KeybindHBoxContainer/MovementVBoxContainer/HBoxContainer/VBoxContainer/HBoxContainer_" + str(j) + "/Button").set_pressed(false)


func _input(event):
	if event is InputEventKey: 
		if can_change_key:
			_change_key(event)
			can_change_key = false

func _change_key(new_key):
	#Delete key of pressed button
	if !InputMap.get_action_list(action_string).empty():
		InputMap.action_erase_event(action_string, InputMap.get_action_list(action_string)[0])
	#Check if new key was assigned somewhere else
	for i in ACTIONS:
		if InputMap.action_has_event(i, new_key):
			InputMap.action_erase_event(i, new_key)
			
	#Add new Key
	InputMap.action_add_event(action_string, new_key)
	
	_set_keys()
