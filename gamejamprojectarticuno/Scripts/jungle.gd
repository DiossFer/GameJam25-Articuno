extends Node2D

#Variables y constantes para las flechas
var next_spawn = randf_range(5.0, 10.0)
var time_pass = 0.0
var position_random = 0.0

const X_POSITION1 = -200.0
const X_POSITION2 = 1890.0
#var y_position : Array = [450.0, 200.0, 85.0, 570.0, 800.0]


#Variables y constantes para las zarpas
var prox_spawn = randf_range(15.0, 30.0)
var time_out = 0.0
const Y_POSITION = -50.0

func generateFlecha(v : Vector2, direction):
	var flecha = load("res://Scenes/flecha.tscn")
	var flecha_instance = flecha.instantiate()
	add_child(flecha_instance)
	flecha_instance.position = v
	flecha_instance.setDirection(direction)
	
func generateZarpazo(v : Vector2):
	print("PREPARANDO EL ZARPAZO")
	var zarpazo = load("res://Scenes/zarpazo.tscn")
	var zarpazo_instance = zarpazo.instantiate()
	add_child(zarpazo_instance)
	zarpazo_instance.position = v
	print("quiero piza !vegana seria")
	
func generateYPosition(x_position, direction):
	#print("generando posición")
	position_random = randf_range(-20.0, 900.0)
	#print(x_position)
	#print(position_random)
	generateFlecha(Vector2(x_position, position_random), direction)
	
func generateXPosition(y_position):
	position_random = randf_range(300.0, 1700.0)
	generateZarpazo(Vector2(position_random, y_position))

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	time_pass += delta
	if((next_spawn - time_pass) < 0.0):
		time_pass = 0.0
		next_spawn = randf_range(5.0, 10.0)
		generateYPosition(X_POSITION1, false)
		generateYPosition(X_POSITION1, false)
		generateYPosition(X_POSITION2, true)
		generateYPosition(X_POSITION2, true)
		generateXPosition(Y_POSITION)
		
		
	time_out += delta
	if((prox_spawn - time_out) < 0.0):
		time_out = 0.0
		prox_spawn = randf_range(15.0, 30.0)
		print("generando zarpa")
		generateXPosition(Y_POSITION)
		
	pass
