extends Node2D


func _ready():
	$AnimatedSprite.play('default')
	$AnimatedSprite2.play('default') # Replace with function body.
	$MarginContainer/VBoxContainer/TextureButton.grab_focus()
func _process(delta):
	if $MarginContainer/VBoxContainer/TextureButton.is_hovered()==true:
		$MarginContainer/VBoxContainer/TextureButton.grab_focus()

func _on_AnimatedSprite_animation_finished():
	if $AnimatedSprite.get_animation() == 'default':
		$AnimatedSprite.play('quiet')

func _on_TextureButton_pressed():
	get_tree().change_scene("res://MENU PRINCIPAL.tscn")