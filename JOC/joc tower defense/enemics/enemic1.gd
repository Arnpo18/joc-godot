extends PathFollow2D
var velocitat=80
var vida = 7
var bum = preload("res://joc tower defense/bum.tscn")
var mort = false
var last=false
func _ready():
	pass
	 
func _process(delta):
	if !vida:
		$Area2D/CollisionShape2D.set_deferred('disabled',true)
	offset += velocitat * delta
	
	if offset >= 5350:
		final2()
	if vida <= 0 && mort == false:
		final()
		mort=true
		
func final():
	var b = bum.instance()
	b.global_position=self.global_position
	b.scale=Vector2(2,2)
	GlobalTd.bales.add_child(b)
	GlobalTd.diners+=2.5
	GlobalTd.puntuacio+=5
	$Area2D/CollisionShape2D.set_deferred('disabled',true)
	self.hide()
	$Timer.start()
func _on_Area2D_area_entered(area):
	if area.is_in_group('bala'):
		vida -= 1
		area.queue_free()
		$tocat.play()
	if area.is_in_group('míssil'):
		
		vida -= 3
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
	GlobalTd.vida-=20
	queue_free()


func _on_Timer_timeout():
	queue_free()
