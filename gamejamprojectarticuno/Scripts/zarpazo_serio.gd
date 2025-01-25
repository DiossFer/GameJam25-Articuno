extends Area2D

const SPEED = 5.0 #constante que indica la velocidad de la flecha
var up = false #variable para indicar la dirección de la flecha, indica que va hacia arriba
var down = false #variable para indicar la dirección de la flecha, indica que va hacia abajo

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("me CREO")
	#detecto la dirección a la que va a ir la flecha
	if(position.y <= 0):
		down = true
		gravity *= -1
		
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(down):
		position.y += 1 * SPEED
		if(position.y >= 2000):
			print("me destruyo")
			queue_free()
		else:
			pass
	else:
		position.y -= 1 * SPEED
		if(position.y <= -250.0):
			print("me destruyo")
			queue_free()
		else:
			pass
		
	
	#move_and_slide()

# Called when the arrow leave the camera
func _on_body_entered(body: Node2D) -> void:
	print("chocolate")
	#queue_free()
	pass
