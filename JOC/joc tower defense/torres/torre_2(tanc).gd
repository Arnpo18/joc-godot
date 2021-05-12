extends Area2D
const bala = preload("res://joc tower defense/torres/bala.tscn")
const bala2 = preload("res://joc tower defense/torres/bala_2.tscn")
var enemics = []
var target_actual=null
var dispar = true
var dispar2 = false
var x = 1
var atack_speed = 0.65
var valor = 10
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
			add_child(ball)
			$arma/foc_1.show()
			$animacio_foc.start()
			dispar = false
			$timer_dispar.start()
		if dispar2==true:
			var ball2=bala2.instance()
			ball2.set_target(target_actual)
			add_child(ball2)
			$arma/foc_2.show()
			dispar2=false
			$animacio_foc.start()
			$timer_dispar.start()
		else: 
			pass
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
	if x==1:
		dispar = true 
		x=2# Replace with function body.
	elif x==2:
		dispar2=true
		x=1
func _on_animacio_foc_timeout():
	if x==1:
		$arma/foc_1.hide()
	if x==2:
		$arma/foc_2.hide()# Replace with function body.
func rotacio():
		var juan = target_actual.global_position - global_position
		var selona = atan2(juan.y,juan.x)
		$arma.rotation = (selona + PI/2) 
		
		
