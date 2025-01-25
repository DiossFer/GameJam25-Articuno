extends Node2D

var next_spawn = randf_range(5.0, 10.0)
var time_pass = 0.0
var position_random = 0.0

const X_POSITION1 = -500.0
const X_POSITION2 = 1890.0
var y_position : Array = [450.0, 200.0, 85.0, 570.0, 800.0]

func generateFlecha(v : Vector2):
	var flecha = load("res://Scenes/flecha.tscn")
	var flecha_instance = flecha.instantiate()
	add_child(flecha_instance)
	flecha_instance.position = v
	
func generateYPosition(x_position):
	position_random = randf_range(-20.0, 900.0)
	generateFlecha(Vector2(x_position, position_random))

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	time_pass += delta
	if((next_spawn - time_pass) < 0.0):
		time_pass = 0.0
		next_spawn = randf_range(5.0, 10.0)
		generateYPosition(X_POSITION1)
		generateYPosition(X_POSITION1)
		#generateYPosition(X_POSITION2)
		#generateYPosition(X_POSITION2)
		
	pass
