extends Node
const e1 = preload("res://joc tower defense/enemics/enemic_1.tscn")
const e2 = preload("res://joc tower defense/enemics/enemic_2.tscn")
const t1 = preload("res://joc tower defense/enemics/tanc_enemic_1.tscn")
const a1 = preload("res://joc tower defense/enemics/avio_enemic_1.tscn")
const a2 = preload("res://joc tower defense/enemics/avio_enemic_2.tscn")
var rng=RandomNumberGenerator.new()
var enemic = 0
var n = 0
var ce = 1
var ronda_1 = true
func _ready(): 
	r1()
func _process(delta):
	$Label.text=str(GlobalTd.diners) + '$'
	if ronda_1==false:
		$random.start()
func ran():
	rng.randomize()
	enemic = rng.randf_range(0, 10.0)
	enemic()
func _on_random_timeout():
	ran() # Replace with function body.
func r1():
	$r1.start()
	var enemic = e1.instance()
	$Path2D.add_child(enemic)
func _on_r1_timeout():
	var enemic = e1.instance()
	$Path2D.add_child(enemic)
	ce+=1
	if ce!=4:
		$r1.start()
	elif ce==4:
		ronda_1=false
func enemic():
	if enemic >= 0 and enemic < 5:
		var enemic = e1.instance()
		$Path2D.add_child(enemic)
		n+=1
	elif enemic >= 5 and enemic < 9:
		var enemic = e2.instance()
		$Path2D.add_child(enemic)
		n+=1
	else:
		var enemic = t1.instance()
		$Path2D.add_child(enemic)
		n+=1
		
