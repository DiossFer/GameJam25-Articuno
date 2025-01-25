extends Control

var mute
var mapa
var skin

var nivel = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	load_settings()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_right_b_skin_pressed() -> void:
	pass # Derecha Skin


func _on_left_b_skin_pressed() -> void:
	pass # Izquierda Skin


func _on_right_b_level_pressed() -> void:
	#nivel = obtener_nivel()
	nivel += 1 
	nivel %= 5
	print(nivel)
	actualizar_mapa() 
	actualizar_interfaz()
	
	save_settings()


func _on_left_b_level_pressed() -> void:
	pass # Izquierda Level


func _on_controls_pressed() -> void:
	pass # Controls Scene #TODO


func _on_options_pressed() -> void:
	pass # Options Scene #TODO


func _on_play_pressed() -> void:
	pass # Game Scene #TODO

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

func obtener_nivel () -> int:
	
	var num = 0
	
	if (mapa=="Jungla"):
		num=0
	elif (mapa=="Edad de hielo"):
		num=1
	elif (mapa=="Volcan"):
		num=2
	elif (mapa=="Edad media"):
		num=3
	elif (mapa=="Cyberpunk"):
		num=4
	
	return num



func actualizar_mapa ():	
	if (nivel==0):
		mapa="Jungla"
	elif (nivel==1):
		mapa="Edad de hielo"
	elif (nivel==2):
		mapa="Volcan"
	elif (nivel==3):
		mapa="Edad media"
	elif (nivel==4):
		mapa="Cyberpunk"

func actualizar_interfaz ():
	$"HBoxContainer/VBoxContainer/HBoxContainer/mapa".text = mapa
	pass#TODO
	
	
