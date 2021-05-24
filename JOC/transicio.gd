extends ColorRect
func a():
	$Tween.interpolate_property(get_material(),'shader_param/cutoff',0,1,1.0)
	$Tween.start()


func _on_Tween_tween_completed(object, key):
	queue_free()
