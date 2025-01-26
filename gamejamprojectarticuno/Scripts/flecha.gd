extends Area2D

const SPEED = 5.0 #constante que indica la velocidad de la flecha
var left = false #variable para indicar la dirección de la flecha, indica que va hacia izquierda (true) o derecha (false)

func setDirection(direction):
	left = direction
	if(left == true):
		#print("le doy la vuelta al dardo")
		#Darle la vuelta al sprite si va en dirección contraria
		$Sprite2D.flip_h = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#print("me CREO")
	#detecto la dirección a la que va a ir la flecha
	if(position.x <= 0):
		#print("comprobando hacia donde voy")
		left = false
		#gravity *= -1
		
	else:
		left = true
		#gravity *= 1
		#Darle la vuelta al sprite si va en dirección contraria
		#$Sprite2D.flip_h = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(!left):
		#print("voy hacia la derecha")
		position.x += 1 * SPEED
		if(position.x >= 2000):
			#print("me destruyo")
			queue_free()
		else:
			pass
	else:
		#print("voy hacia la izquierda")
		position.x -= 1 * SPEED
		if(position.x <= -900.0):
			#print("me destruyo")
			queue_free()
		else:
			pass
		
	
	#move_and_slide()

# Called when the arrow leave the camera
func _on_body_entered(body: Node2D) -> void:
	if(body.name == "Burbuja"):
		body.damage()
		get_parent().defeat()
		
	pass
