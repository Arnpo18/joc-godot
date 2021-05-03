extends Area2D
const bala = preload("res://joc tower defense/torres/bala.tscn")
var enemics = []
var target_actual=null
var dispar = true
func _ready():
	$timer_dispar.start() 
func _on_rang_area_entered(area):
	if area.get_parent().has_method('final'):
		enemics.append(area.get_parent()) 
func _on_rang_area_exited(area):
	if area.get_parent().has_method('final'):
		enemics.erase(area.get_parent()) 
func _process(delta):
	enemic_proper()
	if target_actual:
		if dispar== true:
			var ball=bala.instance()
			ball.set_target(target_actual)
			$arma.add_child(ball)
			$arma/foc.show()
			$animacio_foc.start()
			dispar = false
			$timer_dispar.start()
			$arma.rotation = ball.moviment.angle()
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
	$arma/foc.hide()# Replace with function body.
