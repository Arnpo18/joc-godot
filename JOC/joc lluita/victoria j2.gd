extends Node2D


func _ready():
	$AnimatedSprite.play('mort')
	$AnimatedSprite2.play('atac') 
	$MarginContainer/VBoxContainer/TextureButton.grab_focus()
func _process(delta):
	if $MarginContainer/VBoxContainer/TextureButton.is_hovered()==true:
		$MarginContainer/VBoxContainer/TextureButton.grab_focus()


func _on_TextureButton_pressed():
	get_tree().change_scene("res://MENU PRINCIPAL.tscn")

func _on_AnimatedSprite2_animation_finished():
	if $AnimatedSprite2.get_animation()=='atac':
		 $AnimatedSprite2.play('quiet')
