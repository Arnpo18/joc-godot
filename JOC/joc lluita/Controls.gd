extends Control
func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().change_scene("res://joc lluita/menu_seleccio_lluita.tscn")
func _on_Button_pressed():
	get_tree().change_scene("res://joc lluita/menu_seleccio_lluita.tscn")
