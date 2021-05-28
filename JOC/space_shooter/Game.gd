extends Node

var highscore=0
var puntuacio=0
var file2 = File.new()

func _ready():
	file2.open("user://highscore.save", File.READ)
	highscore=file2.get_var()
	if highscore == null:
		highscore=0
var record_file = "user://highscore.save"
func guarda_resultat():
	var file2 = File.new()
	file2.open(record_file, File.WRITE)
	file2.store_var(highscore)
	file2.close()
func carrega_resultat():
	if file2.file_exists(record_file):
		file2.open(record_file,File.READ)
		highscore=file2.get_var()
		file2.close()
	else: highscore=0
