extends Control

func _ready():
	pass
func _physics_process(delta):
	if $MarginContainer/CenterContainer/VBoxContainer/TextureButton2.is_hovered()==true:
		$MarginContainer/CenterContainer/VBoxContainer/TextureButton2.grab_focus()
func _on_TextureButton2_pressed():
	get_tree().change_scene("res://MENU PRINCIPAL.tscn")
