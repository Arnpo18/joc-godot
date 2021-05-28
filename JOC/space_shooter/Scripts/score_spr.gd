extends TextureRect

var Score = 0 setget set_score
func _ready():
	Global.Score_spr = self
	pass

func set_score(new_score):
	
	Score = new_score
	get_node("Label").set_text(str(Score))

	
	pass
	
