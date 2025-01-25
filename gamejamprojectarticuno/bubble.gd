extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var anim_actual = "idle" # variable de animacion cuando esta quieta la burbuja declarada


func _process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor(): 
		velocity += get_gravity() * delta/3


	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor(): 
		velocity.y = JUMP_VELOCITY 


	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction_x := Input.get_axis("ui_left", "ui_right") # cuando se mueve de izquierda a derecha
	if direction_x: 
		velocity.x = direction_x * SPEED # movereme en la dirección a la velocidad
		cambiar_animacion("burbuja_movimiento2")
		
		if velocity.x < 0:
			$Sprite2D3.flip_h = true # animacion que voltea el sprite
		else:
			$Sprite2D3.flip_h = false
	else:
		velocity.x = 0 # animacion de parada
		cambiar_animacion("idle")
		
	#salto en el aire comentado
	var direction_y := Input.get_axis("ui_up", "ui_down")
	if direction_y:
		velocity.y = direction_y * SPEED
	

	move_and_slide() 
	

# funcion para cambiar de animacion
func cambiar_animacion(nombre_anim):
	if nombre_anim != anim_actual:
		$Sprite2D3/AnimationPlayer.play(nombre_anim)
		anim_actual = nombre_anim
		

func _on_body_entered(body: Node2D) -> void:
	pass
	
	
