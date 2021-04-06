extends Node2D

func _ready():
	$MarginContainer/VBoxContainer/TextureButton.grab_focus()

func _physics_process(delta):
	if $MarginContainer/VBoxContainer/TextureButton.is_hovered() == true:
		$MarginContainer/VBoxContainer/TextureButton.grab_focus()
	if $MarginContainer/VBoxContainer/TextureButton2.is_hovered() == true:
		$MarginContainer/VBoxContainer/TextureButton2.grab_focus()
	if $MarginContainer/VBoxContainer/TextureButton3.is_hovered() == true:
		$MarginContainer/VBoxContainer/TextureButton3.grab_focus()


func _on_TextureButton_pressed():
	get_tree().change_scene("res://joc pong/PONG1J.tscn") 


func _on_TextureButton2_pressed():
	get_tree().change_scene("res://joc pong/PONG 2J.tscn")


func _on_TextureButton3_pressed():
	get_tree().quit() # Replace with function body.
