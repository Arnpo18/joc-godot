extends Area2D


export var vel = Vector2()
const flare_scene = preload("res://space_shooter/Scenes/Flare.tscn")
func _ready():
	create_flare()
	
	yield(get_node("VisibilityNotifier2D"), "screen_exited")
	queue_free()
	pass

func _process(delta):
	translate(vel * delta)
	
	pass
func create_flare():
	var flare = flare_scene.instance()
	flare.position = position
	get_tree().get_root().add_child(flare)
	pass
