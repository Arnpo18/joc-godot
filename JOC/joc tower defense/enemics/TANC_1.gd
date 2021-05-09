extends PathFollow2D
var velocitat=60
var vida = 25
func _ready():
	pass
	 
func _process(delta):
	offset += velocitat * delta
	if offset >= 3000:
		final()
	if vida == 0:
		final()
		GlobalTd.diners+=10
func final():
	queue_free()


func _on_Area2D_area_entered(area):
	if area.is_in_group('bala'):
		vida -= 1
		area.queue_free()
