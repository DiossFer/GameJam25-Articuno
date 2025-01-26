extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var anim_actual = null # variable de animacion cuando esta quieta la burbuja declarada

func damage():
	#print("como daño") #TODO animación muerte
	pass

func _process(delta: float) -> void:
	if not is_on_floor(): 
		velocity += get_gravity() * delta/3


	if Input.is_action_just_pressed("ui_accept") and is_on_floor(): 
		velocity.y = JUMP_VELOCITY 

	var direction_x := Input.get_axis("ui_left", "ui_right") # cuando se mueve de izquierda a derecha
	if direction_x: 
		velocity.x = direction_x * SPEED # movereme en la dirección a la velocidad
		cambiar_animacion("burbuja_movimiento")
		
		if velocity.x < 0:
			$Sprite2D3.flip_h = true # animacion que voltea el sprite
		else:
			$Sprite2D3.flip_h = false
	else:
		velocity.x = 0 # animacion de parada
		cambiar_animacion("quieto")
	
	var direction_y := Input.get_axis("ui_up", "ui_down")
	if direction_y:
		velocity.y = direction_y * SPEED
	move_and_slide() 
	
# funcion para cambiar de animacion
func cambiar_animacion(nombre_anim):
	if nombre_anim != anim_actual:
		$Sprite2D3/AnimationPlayer.play(nombre_anim)
		anim_actual = nombre_anim
