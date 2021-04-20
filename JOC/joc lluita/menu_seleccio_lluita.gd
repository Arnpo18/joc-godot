extends Control
var j1=false
var j2=false
var mapa=false
func _ready():
	pass

func _process(delta):
 pass

func _on_cavaller1_pressed():
	j1==true
	GlobalLluita.personatge1==0
func _on_cavaller2_pressed():
	j1==true
	GlobalLluita.personatge1==1
func _on_samurai_pressed():
	j1==true
	GlobalLluita.personatge1==2
func _on_piba_pressed():
	j1==true
	GlobalLluita.personatge1==3
func _on_reina_pressed():
	j1==true
	GlobalLluita.personatge1==4
func _on_x_pressed():
	j1==false # Replace with function body.
func _on_cavaller1_2_pressed():
	j2==true
	GlobalLluita.personatge2==0
func _on_cavaller2_2_pressed():
	j2==true
	GlobalLluita.personatge2==1 # Replace with function body.
func _on_samurai_2_pressed():
	j2==true
	GlobalLluita.personatge2==2
func _on_piba_2_pressed():
	j2==true
	GlobalLluita.personatge2==3
func _on_reina_2_pressed():
	j2==true
	GlobalLluita.personatge2==4
func _on_x_2_pressed():
	j2=false # Replace with function body.
