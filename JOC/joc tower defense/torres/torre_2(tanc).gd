extends Area2D
const bala = preload("res://joc tower defense/torres/bala.tscn")
const bala2 = preload("res://joc tower defense/torres/bala_2.tscn")
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
		rotacio()
		if dispar== true:
			var ball=bala.instance()
			ball.set_target(target_actual)
			add_child(ball)
			var ball2=bala2.instance()
			ball2.set_target(target_actual)
			add_child(ball2)
			$arma/foc_1.show()
			$arma/foc_2.show()
			$animacio_foc.start()
			dispar = false
			$timer_dispar.start()
			
		else: pass
func enemic_proper():
	var distancies=[]
	if enemics.size()>0:
		for enemic in enemics:
			distancies.append((enemic.position-position))
		var minim = distancies.min()
		var ind_minim = distancies.find(minim)
		target_actual = enemics[ind_minim]
	else: 
		target_actual=null
func _on_timer_dispar_timeout():
	dispar = true # Replace with function body.
func _on_animacio_foc_timeout():
	$arma/foc_1.hide()
	$arma/foc_2.hide()
func rotacio():
		var juan = target_actual.global_position - global_position
		var selona = atan2(juan.y,juan.x)
		$arma.rotation = selona + PI/2
