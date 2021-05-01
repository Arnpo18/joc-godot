extends PathFollow2D
var velocitat=150
var vida = 10
func _ready():
	pass
	 
func _process(delta):
	offset += velocitat * delta
	if offset >= 3000:
		final()
func final():
	queue_free()
