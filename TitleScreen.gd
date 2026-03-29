# ============================================================
# TitleScreen.gd
# Controla la pantalla de título y las transiciones de escena.
# ============================================================
extends Control

# @export reemplaza export(String) de Godot 3
@export var scene_path_to_load : String = ""

func _ready() -> void:
	# Foco inicial en el primer botón para navegación con teclado/gamepad
	$menu/CenterRow/Buttons/EnterNexusButton.grab_focus()

	# Conectamos todos los botones del contenedor
	# Godot 4: signal.connect(callable) reemplaza connect("signal", obj, "method")
	for button in $menu/CenterRow/Buttons.get_children():
		button.pressed.connect(_on_Button_pressed.bind(button.scene_to_load))

func _on_Button_pressed(scene_to_load: String) -> void:
	scene_path_to_load = scene_to_load
	$FadeIn.show()
	$FadeIn.fade_in()

func _on_FadeIn_fade_finished() -> void:
	# Godot 4: change_scene_to_file() reemplaza change_scene()
	get_tree().change_scene_to_file(scene_path_to_load)
