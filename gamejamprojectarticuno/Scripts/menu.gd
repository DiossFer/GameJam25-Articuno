extends Control

const nivelesTotales = 5
const skinesTotales = 3

var mute
var mapa
var skin

var nivel = 0
var skinActual = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	load_settings()
	obtener_skin()
	
	var ruta = "res://Assets/Sprites/Pompa"+str(skinActual)+".png"
	$HBoxContainer/VBoxContainer2/CharacterSkin.texture = load(ruta)
	$HBoxContainer/VBoxContainer2/HBoxContainer/NombreSkin.text=skin
	$HBoxContainer/VBoxContainer/HBoxContainer/mapa.text = mapa

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_right_b_skin_pressed() -> void:
	skinActual+=1
	skinActual%=skinesTotales
	actualizar_skin()
	$HBoxContainer/VBoxContainer2/HBoxContainer/NombreSkin.text = skin
	var ruta = "res://Assets/Sprites/Pompa"+str(skinActual)+".png";
	$HBoxContainer/VBoxContainer2/CharacterSkin.texture = load(ruta);
	
	save_settings()




func _on_left_b_skin_pressed() -> void:
	skinActual-=1
	
	if (skinActual<0):
		skinActual=skinesTotales-1
	
	actualizar_skin()
	$HBoxContainer/VBoxContainer2/HBoxContainer/NombreSkin.text = skin
	var ruta = "res://Assets/Sprites/Pompa"+str(skinActual)+".png";
	$HBoxContainer/VBoxContainer2/CharacterSkin.texture = load(ruta);
	
	save_settings()


func _on_right_b_level_pressed() -> void:
	#nivel = obtener_nivel()
	nivel += 1 
	nivel %= nivelesTotales
	
	actualizar_mapa() 
	actualizar_interfaz()
	
	save_settings()


func _on_left_b_level_pressed() -> void:
	#nivel = obtener_nivel()
	nivel -= 1
	
	if (nivel<0):
		nivel=nivelesTotales-1
	
	
	actualizar_mapa() 
	actualizar_interfaz()
	
	save_settings()


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

	

func obtener_skin ():
	if (skin=="Default"):
		skinActual=0
	elif (skin=="Pink"):
		skinActual=1
	elif (skin=="Ice"):
		skinActual=2
	
	

func actualizar_skin ():	
	if (skinActual==0):
		skin="Default"
	elif (skinActual==1):
		skin="Pink"
	elif (skinActual==2):
		skin="Ice"
	


func actualizar_interfaz ():
	$"HBoxContainer/VBoxContainer/HBoxContainer/mapa".text = mapa
	pass#TODO
