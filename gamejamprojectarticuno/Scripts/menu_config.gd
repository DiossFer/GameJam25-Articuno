extends Control

var mute
var mapa
var skin


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if (mute):
		$VBoxContainer/Button.text = "volumen: on"
	else:
		$VBoxContainer/Button.text = "volumen: off"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	if ($VBoxContainer/Button.text == "volumen: on"):
		$VBoxContainer/Button.text = "volumen: on"
	else:
		$VBoxContainer/Button.text = "volumen: off"
		
	mute=!mute
	
	save_settings()
	

func save_settings():
	var config = ConfigFile.new()

	config.set_value("audio", "audio", mute)
	config.set_value("juego", "mapa", mapa)
	config.set_value("juego", "skin", skin)

	config.save("settings.cfg")



func load_settings():
	var config = ConfigFile.new()
	
	config.load("settings.cfg")
	
	mute = config.get_value("audio", "mute", false)
	mapa = config.get_value("juego", "mapa", "jungle")
	skin = config.get_value("juego", "skin", "Default")


func _on_button_2_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/menu.tscn")
