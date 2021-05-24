extends Node2D
func _ready():
	$TextureButton.grab_focus()
	$Tween.interpolate_property($TextureButton,'rect_position',Vector2(643,-500),Vector2(643,250),1)
	$Tween.interpolate_property($TextureButton2,'rect_position',Vector2(1927,450),Vector2(600,450),1)
	$Tween.interpolate_property($TextureButton3,'rect_position',Vector2(740,1500),Vector2(740,850),1)
	$Tween.interpolate_property($TextureButton4,'rect_position',Vector2(-430,650),Vector2(620,650),1)
	$Tween.start()
func _physics_process(delta):
	if $TextureButton.is_hovered() == true:
		$TextureButton.grab_focus()
	if $TextureButton2.is_hovered() == true:
		$TextureButton2.grab_focus()
	if $TextureButton3.is_hovered() == true:
		$TextureButton3.grab_focus()
	if $TextureButton4.is_hovered() == true:
		$TextureButton4.grab_focus()
func _on_TextureButton_pressed():
	get_tree().change_scene("res://joc pong/PONG1J.tscn") 
func _on_TextureButton2_pressed():
	get_tree().change_scene("res://joc pong/PONG2J.tscn")
func _on_TextureButton3_pressed():
	get_tree().quit() 
func _on_TextureButton4_pressed():
	get_tree().change_scene("res://joc pong/Controls.tscn")
