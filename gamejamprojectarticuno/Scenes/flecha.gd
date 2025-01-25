extends Area2D

const SPEED = 5.0 #constante que indica la velocidad de la flecha
var up = false #variable para indicar la dirección de la flecha, indica que va hacia arriba
var down = false #variable para indicar la dirección de la flecha, indica que va hacia abajo

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#detecto la dirección a la que va a ir la flecha
	if(position.y <= 0):
		print("Voy hacia arriba")
		print(position.y)
		up = true
		gravity *= -1
		
	else:
		print("Voy hacia abajo")
		down = true
		gravity *= 1
		#Darle la vuelta al sprite si va en dirección contraria
		$Sprite2D.flip_h = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(down):
		position.y += 1 * SPEED
	else:
		position.y -= 1 * SPEED
	
	#move_and_slide()

# Called when the arrow leave the camera
func _on_body_entered(body: Node2D) -> void:
	pass
