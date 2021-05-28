extends Control

func _ready():
	set_visible(false)
	pass
	


func _input(event):
	
	if event.is_action_pressed("ui_cancel"):
		set_visible(!get_tree().paused)
		get_tree().paused = !get_tree().paused
		
	
func _on_ContinueButton_pressed():
	get_tree().paused = false
	set_visible(false)
	pass


func set_visible(is_visible):
	for node in get_children():
		node.visible = is_visible
	pass


func _on_ContinueButton2_pressed():
	get_tree().change_scene("res://MENU PRINCIPAL.tscn")
	get_tree().paused = false
