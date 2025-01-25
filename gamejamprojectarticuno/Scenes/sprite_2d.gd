extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
		visible = true # Objeto invisible
		await get_tree().create_timer(3.0).timeout  # Durante estos segundos el aviso está invisible 
		visible = false
		
	 
