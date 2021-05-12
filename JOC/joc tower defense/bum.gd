extends AnimatedSprite


# Declare member variables here. Examples:
# Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
func _ready():
	play('default')


func _on_AnimatedSprite_animation_finished():
	if self.animation=='default':
		queue_free() # Replace with function body.
