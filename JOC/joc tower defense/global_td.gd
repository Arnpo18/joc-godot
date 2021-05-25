extends Node

var diners = 5
var bales
var vida =100
var as1=1
var as2=0.65
var as3=1.8
var as4=1
var vida_tanc=50
var vida_avio1=15
var vida_avio2=40
var v_tanc=60
var v_avio1=300
var v_avio2=200
var highscore=0
var puntuacio=0
var file = File.new()
func _ready():
	file.open("user://record.guarda", File.READ)
	highscore=file.get_var()
var record_file = "user://record.guarda"
func guarda_resultat():
	var file = File.new()
	file.open(record_file, File.WRITE)
	file.store_var(highscore)
	file.close()
func carrega_resultat():
	if file.file_exists(record_file):
		file.open(record_file,File.READ)
		highscore=file.get_var()
		file.close()
	else: highscore=0	
