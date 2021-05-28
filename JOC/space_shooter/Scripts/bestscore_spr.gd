extends TextureRect



func _ready():
	if Game.highscore == null:
		$Label.text=(str(0))
	elif get_child_count()>0 and Game.highscore:
		$Label.text=str(Game.highscore)
	pass


