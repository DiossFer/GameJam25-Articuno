extends Area2D

const SPEED = 120.0  # Constante que indica la velocidad de la flecha
var up = false  # Variable para indicar la dirección de la flecha, indica que va hacia arriba
var down = false  # Variable para indicar la dirección de la flecha, indica que va hacia abajo
var puede_caer = false  # Variable para controlar el inicio de la caída

# Se ejecuta cuando el nodo entra en la escena
func _ready() -> void:
	await get_tree().create_timer(2.0).timeout  
	puede_caer = true  # Activa la caída

	# Detecta la dirección a la que va a ir la flecha
	if position.y <= 0:
		down = true

# Se ejecuta en cada frame
func _process(delta: float) -> void:
	if puede_caer:  # Solo se moverá si han pasado los 6 segundos
		if down:
			position.y += 1 * SPEED
			if position.y >= 2000:
				print("me destruyo")
				queue_free()
		else:
			position.y -= 1 * SPEED
			if position.y <= -250.0:
				print("me destruyo")
				queue_free()

# Cuando la garra colisiona con otro objeto
func _on_body_entered(body: Node2D) -> void:
	print("chocolate")
