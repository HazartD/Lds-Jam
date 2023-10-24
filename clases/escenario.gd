extends Node2D
class_name Escenario
var numdial:int=0
var dial:PackedStringArray=[]
var dialname:String
const vel:float=0.2
func _ready():
	pass
	Seales.change.connect(changed)
	
func changed():
	pass
func metertexto():
	var tewn=create_tween()
	if numdial<=dial.size():
#		$D.visible=true
#		$D/C/TN/N.text=tr(dialname)
#		$D/C/TT/T.visible_ratio=0.0
#		$D/C/TT/T.text=tr(dial[numdial])
#		var dura=vel*dial[numdial].length()
#		tewn.tween_property($D/C/TT/T,"visible_ratio",1.0,dura)
#		numdial=+1
#	else:
#		numdial=0
#		$D.visible=false
#		$D/C/TN/N.text=""
#		$D/C/TT/T.text=""
#

