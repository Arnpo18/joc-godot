extends Control
var j1=false
var j2=false
func _ready():
	$ColorRect4.a()
func _process(delta):
 pass
func _on_cavaller1_pressed():
	j1=true
	GlobalLluita.personatge1=0
	$MarginContainer/VBoxContainer/HBoxContainer/GridContainer/cavaller1/Polygon2D.show()
	$MarginContainer/VBoxContainer/HBoxContainer/GridContainer/cavaller2/Polygon2D.hide()
	$MarginContainer/VBoxContainer/HBoxContainer/GridContainer/samurai/Polygon2D.hide()
	$MarginContainer/VBoxContainer/HBoxContainer/GridContainer/piba/Polygon2D.hide()
	$MarginContainer/VBoxContainer/HBoxContainer/GridContainer/reina/Polygon2D.hide()
func _on_cavaller2_pressed():
	j1=true
	GlobalLluita.personatge1=1
	$MarginContainer/VBoxContainer/HBoxContainer/GridContainer/cavaller2/Polygon2D.show()
	$MarginContainer/VBoxContainer/HBoxContainer/GridContainer/cavaller1/Polygon2D.hide()
	$MarginContainer/VBoxContainer/HBoxContainer/GridContainer/samurai/Polygon2D.hide()
	$MarginContainer/VBoxContainer/HBoxContainer/GridContainer/piba/Polygon2D.hide()
	$MarginContainer/VBoxContainer/HBoxContainer/GridContainer/reina/Polygon2D.hide()
func _on_samurai_pressed():
	j1=true
	GlobalLluita.personatge1=2
	$MarginContainer/VBoxContainer/HBoxContainer/GridContainer/samurai/Polygon2D.show()
	$MarginContainer/VBoxContainer/HBoxContainer/GridContainer/cavaller1/Polygon2D.hide()
	$MarginContainer/VBoxContainer/HBoxContainer/GridContainer/cavaller2/Polygon2D.hide()
	$MarginContainer/VBoxContainer/HBoxContainer/GridContainer/piba/Polygon2D.hide()
	$MarginContainer/VBoxContainer/HBoxContainer/GridContainer/reina/Polygon2D.hide()
func _on_piba_pressed():
	j1=true
	GlobalLluita.personatge1=3
	$MarginContainer/VBoxContainer/HBoxContainer/GridContainer/piba/Polygon2D.show()
	$MarginContainer/VBoxContainer/HBoxContainer/GridContainer/cavaller1/Polygon2D.hide()
	$MarginContainer/VBoxContainer/HBoxContainer/GridContainer/cavaller2/Polygon2D.hide()
	$MarginContainer/VBoxContainer/HBoxContainer/GridContainer/samurai/Polygon2D.hide()
	$MarginContainer/VBoxContainer/HBoxContainer/GridContainer/reina/Polygon2D.hide()
func _on_reina_pressed():
	j1=true
	GlobalLluita.personatge1=4
	$MarginContainer/VBoxContainer/HBoxContainer/GridContainer/reina/Polygon2D.show()
	$MarginContainer/VBoxContainer/HBoxContainer/GridContainer/cavaller1/Polygon2D.hide()
	$MarginContainer/VBoxContainer/HBoxContainer/GridContainer/cavaller2/Polygon2D.hide()
	$MarginContainer/VBoxContainer/HBoxContainer/GridContainer/samurai/Polygon2D.hide()
	$MarginContainer/VBoxContainer/HBoxContainer/GridContainer/piba/Polygon2D.hide()
func _on_x_pressed():
	j1=false 
	GlobalLluita.personatge1=-1
	$MarginContainer/VBoxContainer/HBoxContainer/GridContainer/cavaller1/Polygon2D.hide()
	$MarginContainer/VBoxContainer/HBoxContainer/GridContainer/cavaller2/Polygon2D.hide()
	$MarginContainer/VBoxContainer/HBoxContainer/GridContainer/samurai/Polygon2D.hide()
	$MarginContainer/VBoxContainer/HBoxContainer/GridContainer/piba/Polygon2D.hide()
	$MarginContainer/VBoxContainer/HBoxContainer/GridContainer/reina/Polygon2D.hide()
func _on_cavaller1_2_pressed():
	j2=true
	GlobalLluita.personatge2=0
	$MarginContainer2/VBoxContainer/HBoxContainer/GridContainer/cavaller1_2/Polygon2D.show()
	$MarginContainer2/VBoxContainer/HBoxContainer/GridContainer/cavaller2_2/Polygon2D.hide()
	$MarginContainer2/VBoxContainer/HBoxContainer/GridContainer/samurai_2/Polygon2D.hide()
	$MarginContainer2/VBoxContainer/HBoxContainer/GridContainer/piba_2/Polygon2D.hide()
	$MarginContainer2/VBoxContainer/HBoxContainer/GridContainer/reina_2/Polygon2D.hide()
func _on_cavaller2_2_pressed():
	j2=true
	$MarginContainer2/VBoxContainer/HBoxContainer/GridContainer/cavaller2_2/Polygon2D.show()
	$MarginContainer2/VBoxContainer/HBoxContainer/GridContainer/cavaller1_2/Polygon2D.hide()
	$MarginContainer2/VBoxContainer/HBoxContainer/GridContainer/samurai_2/Polygon2D.hide()
	$MarginContainer2/VBoxContainer/HBoxContainer/GridContainer/piba_2/Polygon2D.hide()
	$MarginContainer2/VBoxContainer/HBoxContainer/GridContainer/reina_2/Polygon2D.hide()
	GlobalLluita.personatge2=1 
func _on_samurai_2_pressed():
	j2=true
	GlobalLluita.personatge2=2
	$MarginContainer2/VBoxContainer/HBoxContainer/GridContainer/samurai_2/Polygon2D.show()
	$MarginContainer2/VBoxContainer/HBoxContainer/GridContainer/cavaller1_2/Polygon2D.hide()
	$MarginContainer2/VBoxContainer/HBoxContainer/GridContainer/cavaller2_2/Polygon2D.hide()
	$MarginContainer2/VBoxContainer/HBoxContainer/GridContainer/piba_2/Polygon2D.hide()
	$MarginContainer2/VBoxContainer/HBoxContainer/GridContainer/reina_2/Polygon2D.hide()
func _on_piba_2_pressed():
	j2=true
	GlobalLluita.personatge2=3
	$MarginContainer2/VBoxContainer/HBoxContainer/GridContainer/piba_2/Polygon2D.show()
	$MarginContainer2/VBoxContainer/HBoxContainer/GridContainer/cavaller1_2/Polygon2D.hide()
	$MarginContainer2/VBoxContainer/HBoxContainer/GridContainer/cavaller2_2/Polygon2D.hide()
	$MarginContainer2/VBoxContainer/HBoxContainer/GridContainer/samurai_2/Polygon2D.hide()
	$MarginContainer2/VBoxContainer/HBoxContainer/GridContainer/reina_2/Polygon2D.hide()
func _on_reina_2_pressed():
	j2=true
	GlobalLluita.personatge2=4
	$MarginContainer2/VBoxContainer/HBoxContainer/GridContainer/reina_2/Polygon2D.show()
	$MarginContainer2/VBoxContainer/HBoxContainer/GridContainer/cavaller1_2/Polygon2D.hide()
	$MarginContainer2/VBoxContainer/HBoxContainer/GridContainer/cavaller2_2/Polygon2D.hide()
	$MarginContainer2/VBoxContainer/HBoxContainer/GridContainer/samurai_2/Polygon2D.hide()
	$MarginContainer2/VBoxContainer/HBoxContainer/GridContainer/piba_2/Polygon2D.hide()
func _on_x_2_pressed():
	j2=false 
	GlobalLluita.personatge2=-1
	$MarginContainer2/VBoxContainer/HBoxContainer/GridContainer/cavaller1_2/Polygon2D.hide()
	$MarginContainer2/VBoxContainer/HBoxContainer/GridContainer/cavaller2_2/Polygon2D.hide()
	$MarginContainer2/VBoxContainer/HBoxContainer/GridContainer/samurai_2/Polygon2D.hide()
	$MarginContainer2/VBoxContainer/HBoxContainer/GridContainer/piba_2/Polygon2D.hide()
	$MarginContainer2/VBoxContainer/HBoxContainer/GridContainer/reina_2/Polygon2D.hide()
func _on_Button_pressed():
	if j1==true && j2 == true:
		get_tree().change_scene("res://joc lluita/escena.tscn")
		$Button.disabled=true
	if j1==false:
		$j1.scale.x=1.5
		$j1.scale.y=1.5
		$tj1.start()
	if j2==false:
		$j2.scale.x=1.5
		$j2.scale.y=1.5
		$tj2.start()
func _on_tj1_timeout():
	$j1.scale.x=1
	$j1.scale.y=1 
func _on_tj2_timeout():
	$j2.scale.x=1
	$j2.scale.y=1
func _on__pressed():
	get_tree().change_scene("res://joc lluita/Controls.tscn")