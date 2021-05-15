extends Node
const e1 = preload("res://joc tower defense/enemics/enemic_1.tscn")
const e2 = preload("res://joc tower defense/enemics/enemic_2.tscn")
const t1 = preload("res://joc tower defense/enemics/tanc_enemic_1.tscn")
const a1 = preload("res://joc tower defense/enemics/avio_enemic_1.tscn")
const a2 = preload("res://joc tower defense/enemics/avio_enemic_2.tscn")
var enemic = true
var ronda=1
var n=0
func _ready():
	$ronda_1.start()	
func _process(delta):
	$Label.text = str(GlobalTd.diners)+('$')
	if ronda==1:
		ronda==0
	if ronda==2 and $Path2D.get_child_count()==0:
		n=0
		ronda_2()
		ronda=0
	if ronda==3 and $Path2D.get_child_count()==0:
		n=0
		ronda_3()
		ronda=0
	if ronda==4 and $Path2D.get_child_count()==0:
		n=0
		ronda=0
		ronda_4()
	if ronda==5 and $Path2D.get_child_count()==0:
		n=0
		ronda=0
		ronda_5()
func e1():
	var a = e1.instance()
	$Path2D.add_child(a)
func e2():
	var a = e2.instance()
	$Path2D.add_child(a)
func t1():
	var a = t1.instance()
	$Path2D.add_child(a)
func a1():
	var a = a1.instance()
	$Path2D.add_child(a)
func a2():
	var a = a2.instance()
	$Path2D.add_child(a)
func _on_ronda_1_timeout():
	e1()
	n+=1
	if n<6:
		$ronda_1.start()
	else: ronda=2
func ronda_2():
	if n==0:
		e1()
		enemic=false
		n+=1
	if n==1:
		e1()
		enemic=false
		n+=1
	elif n==2:
		t1()
		enemic=false
		n+=1
	elif n==3:
		e2()
		enemic=false
		n+=1
		$enemic.wait_time=15
	elif n==4:
		a1()
		ronda = 3
	if enemic == false:
		$enemic.start()
func _on_enemic_timeout():
	enemic = true 
	ronda_2()
func ronda_3():
	if n==0:
		t1()
		n+=1
		$ronda_3.start()
	elif n==1:
		t1()
		n+=1
		$ronda_3.wait_time=5
		$ronda_3.start()
	elif n==2:
		e1()
		n+=1
		$ronda_3.wait_time=5
		$ronda_3.start()
	elif n==3:
		t1()
		n+=1
		$ronda_3.wait_time=2.5
		$ronda_3.start()
	elif n==4:
		t1()
		ronda=4
func _on_ronda_3_timeout():
	ronda_3() # Replace with function body.
func ronda_4():
	if n==0:
		a1()
		n+=1
		$ronda_4.start()
	elif n==1:
		a1()
		n+=1
		$ronda_4.start()
	elif n==2:
		e1()
		n+=1
		$ronda_4.wait_time=1.5
		$ronda_4.start()
	elif n==3:
		e1()
		n+=1
		$ronda_4.wait_time=1.5
		$ronda_4.start()
	elif n==4:
		e1()
		n+=1
		$ronda_4.wait_time=1.5
		$ronda_4.start()
	elif n==5:
		t1()
		n+=1
		$ronda_4.wait_time=2
		$ronda_4.start()
	elif n==6:
		e1()
		n+=1
		$ronda_4.wait_time=1.5
		$ronda_4.start()	
	elif n==7:
		e1()
		n+=1
		$ronda_4.wait_time=1.5
		$ronda_4.start()
	elif n==8:
		e1()
		n+=1
		$ronda_4.wait_time=8
		$ronda_4.start()
	elif n==9:
		a1()
		n+=1
		$ronda_4.wait_time=5
		$ronda_4.start()
	elif n==10:
		a1()
		ronda=5
func _on_ronda_4_timeout():
	ronda_4() # Replace with function body.
func ronda_5():
	if n==0:
		t1()
		n+=1
		$ronda_5.start()
	elif n==1:
		t1()
		a1()
		n+=1
		$ronda_5.start()
	elif n==2:
		t1()
		a1()
		n+=1
		$ronda_5.wait_time=6
		$ronda_5.start()
	elif n==3:
		t1()
		a1()
		n+=1
		$ronda_5.wait_time=2
		$ronda_5.start()
	elif n==4:
		t1()
		a1()
		n+=1
		$ronda_5.start()
	elif n==5:
		t1()
		n+=1
		$ronda_5.wait_time=6
		$ronda_5.start()
	elif n==6:
		t1()
		a1()
		n+=1
		$ronda_5.wait_time=2
		$ronda_5.start()
	elif n==7:
		t1()
		a1()
		n+=1
		$ronda_5.start()
	elif n==8:
		t1()
		n+=1
		$ronda_5.wait_time=10
		$ronda_5.start()
	elif n==9:
		a2()
		ronda==6
func _on_ronda_5_timeout():
	ronda_5()

