extends Node
const e1 = preload("res://joc tower defense/enemics/enemic_1.tscn")
const e2 = preload("res://joc tower defense/enemics/enemic_2.tscn")
const t1 = preload("res://joc tower defense/enemics/tanc_enemic_1.tscn")
const a1 = preload("res://joc tower defense/enemics/avio_enemic_1.tscn")
const a2 = preload("res://joc tower defense/enemics/avio_enemic_2.tscn")
var enemic = 0
var n = 0
var ce = 1
var ronda_1 = true

func _process(delta):
	$Label.text = str(GlobalTd.diners)+('$')
func _on_spawn_timeout():
	if n < 6:
		var awa = e1.instance()
		$Path2D.add_child(awa)
		n+=1
	if n >= 6:
		$spawn.wait_time=2.8
		randomize()
		var uwu=randf()
		if uwu >= 0 and uwu <0.6:
			var awa = e1.instance()
			$Path2D.add_child(awa)
			n+=1
		elif uwu >=0.6 and uwu<0.85:
			var awa = e2.instance()
			$Path2D.add_child(awa)
			n+=1
		else:
			var awa = t1.instance()
			$Path2D.add_child(awa)
			n+=1
	if n>35:
		$spawn.wait_time=2.4
		randomize()
		var uwu=randf()
		if uwu >= 0 and uwu <0.2:
			var awa = e1.instance()
			$Path2D.add_child(awa)
			n+=1
		if uwu >= 0.2 and uwu <0.45:
			var awa = e2.instance()
			$Path2D.add_child(awa)
			n+=1
		if uwu >= 0.45 and uwu <0.75:
			var awa = t1.instance()
			$Path2D.add_child(awa)
			n+=1
		if uwu >= 0.75 and uwu <0.95:
			var awa = a1.instance()
			$Path2D.add_child(awa)
			n+=1
		if uwu >= 0.95 and uwu <1.01:
			var awa = a2.instance()
			$Path2D.add_child(awa)
			n+=1
		
