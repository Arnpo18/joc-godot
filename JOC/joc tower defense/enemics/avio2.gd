extends PathFollow2D
var velocitat=GlobalTd.v_avio2
var vida = GlobalTd.vida_avio2
var bum = preload("res://joc tower defense/bum.tscn")
func _ready():
	pass
	 
func _process(delta):
	$Label.text=str(vida)
	offset += velocitat * delta
	if offset >= 5350:
		final2()	
	if vida <= 0:
		final()
		
func final():

	var b = bum.instance()
	b.global_position=self.global_position
	b.scale=Vector2(2,2)
	GlobalTd.bales.add_child(b)
	queue_free()
	GlobalTd.diners+=15
	GlobalTd.puntuacio+=100
func _on_Area2D_area_entered(area):
	if area.is_in_group('bala'):
		$tocat.play()
		vida -= 1
		area.queue_free()
	if area.is_in_group('míssil'):

		vida -= 4
		var a = bum.instance()
		a.global_position=area.global_position
		GlobalTd.bales.add_child(a)
		a.play('default')
		area.queue_free()
func final2():

	var a = bum.instance()
	a.global_position=global_position
	GlobalTd.bales.add_child(a)
	a.play('default')
	GlobalTd.vida-=50
	queue_free()
