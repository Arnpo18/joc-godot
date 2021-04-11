extends Node


var debug = false


func _ready():
	$Camera2D.add_target($personatge1)
	$Camera2D.add_target($personatge2)


func _process(delta):
	if $personatge1.vides==2:
		$ParallaxBackground2/vida_j1_2.hide()
	if $personatge1.vides==1:
		$ParallaxBackground2/vida_j1_3.hide()
	if $personatge1.vides==0:
		$ParallaxBackground2/vida_j1_1.hide()
	if $personatge2.vides==2:
		$ParallaxBackground2/vida_j2_3.hide()
	if $personatge2.vides==1:
		$ParallaxBackground2/vida_j2_2.hide()
	if $personatge2.vides==0:
		$ParallaxBackground2/vida_j2_1.hide()
		
