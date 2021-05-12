extends Area2D
const bala = preload("res://joc tower defense/torres/míssil.tscn")

var enemics = []
var target_actual=null
var dispar = true
var atack_speed = 1.8
var valor = 15
func _ready():
	$timer_dispar.start() 
func _on_rang_area_entered(area):
	if area.get_parent().has_method('final'):
		enemics.append(area.get_parent()) 
func _on_rang_area_exited(area):
	if area.get_parent().has_method('final'):
		enemics.erase(area.get_parent()) 
func _process(delta):
	$timer_dispar.wait_time=atack_speed
	if enemics.has(target_actual)==false:
		enemic_proper()
	elif target_actual:
		pass
	elif !target_actual:
		enemic_proper()
	if target_actual:
		rotacio()
		if dispar== true:
			var ball=bala.instance()
			ball.set_target(target_actual)
			ball.rotation=rotation
			ball.global_position=$arma/Position2D.global_position
			GlobalTd.bales.add_child(ball)
			$base2.hide()
			$arma.show()
			$animacio_foc.start()
			dispar = false
			$timer_dispar.start()
			
		else: pass
func enemic_proper():
	var distancies=[]
	if enemics.size()>0:
		for enemic in enemics:
			distancies.append((enemic.position-position))
		var minim = distancies.max()
		var ind_minim = distancies.find(minim)
		target_actual = enemics[ind_minim]
	else: 
		target_actual=null
func _on_timer_dispar_timeout():
	dispar = true # Replace with function body.
func _on_animacio_foc_timeout():
	$base2.show()
	$arma.hide()
func rotacio():
		var juan = target_actual.global_position - global_position
		var selona = atan2(juan.y,juan.x)
		$arma.rotation = selona + PI/2
		$base2.rotation = selona + PI/2
