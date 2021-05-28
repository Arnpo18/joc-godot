extends TextureProgress
var ultima
func _ready():
	max_value=get_parent().vida
func _process(delta):
	value=get_parent().vida
