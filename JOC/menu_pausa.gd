extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$MarginContainer/CenterContainer/VBoxContainer/TextureButton.grab_focus()  # Replace with function body.
func _physics_process(delta):
	if $MarginContainer/CenterContainer/VBoxContainer/TextureButton.is_hovered()==true:
		$MarginContainer/CenterContainer/VBoxContainer/TextureButton.grab_focus()
	if $MarginContainer/CenterContainer/VBoxContainer/TextureButton2.is_hovered()==true:
		$MarginContainer/CenterContainer/VBoxContainer/TextureButton2.grab_focus()

func _input(event):
	if event.is_action_pressed('ui_cancel'):
		$MarginContainer/CenterContainer/VBoxContainer/TextureButton.grab_focus()
		get_tree().paused = not get_tree().paused
		visible = not visible


func _on_TextureButton_pressed():
	get_tree().paused = not get_tree().paused
	visible = not visible # Replace with function body.


func _on_TextureButton2_pressed():
	get_tree().change_scene("res://MENU PRINCIPAL.tscn") # Replace with function body.
