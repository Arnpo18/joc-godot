extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite.play('default')
	$AnimatedSprite2.play('default') # Replace with function body.

func _process(delta):
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_AnimatedSprite_animation_finished():
	if $AnimatedSprite.get_animation() == 'default':
		$AnimatedSprite.play('quiet')
