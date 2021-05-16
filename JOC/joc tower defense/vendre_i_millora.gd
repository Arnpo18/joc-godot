extends TextureButton

var pop = false
var preu_inicial
var u = 1
var dos = 0.65
var tres = 1.8
var quatre=1

func _ready():
	if get_parent().type==1:
		preu_inicial=2.5
	if get_parent().type==2:
		preu_inicial=5
	if get_parent().type==3:
		preu_inicial=10
	if get_parent().type==4:
		preu_inicial=15
func _process(delta):
	$GridContainer/millora/Label.text=str(preu_inicial)+"$"
func _on_vendre_i_millora_pressed():
	if pop == false:
		$GridContainer.show()
		pop=true
	else:
		$GridContainer.hide()
		pop=false

func _on_millora_pressed():
	if get_parent().type==1 and GlobalTd.diners >= preu_inicial:
		get_parent().ats=u*0.92
		u*=0.92
		GlobalTd.diners -= preu_inicial
		preu_inicial*=1.25
		preu_inicial= stepify(preu_inicial,0.1)
		
	if get_parent().type==2 and GlobalTd.diners >= preu_inicial:
		get_parent().ats=dos*0.92
		dos*=0.92
		GlobalTd.diners -= preu_inicial
		preu_inicial*=1.35
		preu_inicial= stepify(preu_inicial,0.1)
		
	if get_parent().type==3 and GlobalTd.diners >= preu_inicial:
		get_parent().ats=tres*0.92
		tres*=0.92
		GlobalTd.diners -= preu_inicial
		preu_inicial*=1.4
		preu_inicial= stepify(preu_inicial,0.1)
		
	if get_parent().type==4 and GlobalTd.diners >= preu_inicial:
		get_parent().ats=quatre*0.92
		quatre*=0.92
		GlobalTd.diners -= preu_inicial
		preu_inicial*=1.5
		preu_inicial= stepify(preu_inicial,0.1)
		
