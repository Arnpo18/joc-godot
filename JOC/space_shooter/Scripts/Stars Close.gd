extends Sprite


export var vel = Vector2()
func _ready():
	
	pass # Replace with function body.

func _process(delta):
	
	translate(vel * delta)
	
	if position.y >= get_viewport_rect().size.y + 1080:
		position = Vector2(0, -1080)
	pass
