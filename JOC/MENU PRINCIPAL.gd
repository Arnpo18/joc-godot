extends Control
const lluita = preload("res://joc lluita/menu_seleccio_lluita.tscn")
func _ready():
	$GridContainer/space_shooter.text="SPACE"+ "\n " +"SHOOTER"
	
func _on_Button_pressed():
	get_tree().change_scene_to(lluita)
	GlobalLluita.personatge1=-1
	GlobalLluita.personatge2=-1
func _on_Button2_pressed():
	get_tree().change_scene("res://joc tower defense/partida/escena.tscn")
func _on_Button3_pressed():
	get_tree().change_scene("res://joc pong/PANTALLA INICI.tscn")
func _on_Button4_pressed():
	get_tree().change_scene("res://joc plataformes/Escenes/joc_plataformes.tscn")
func _on_exit_pressed():
	get_tree().quit()
func _on_space_shooter_pressed():
	get_tree().change_scene("res://space_shooter/Stages/Stage_menu.tscn")
