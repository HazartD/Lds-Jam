extends CanvasLayer
const vel:float=0.2
signal FIN

func metertexto(namedial:String,dial:PackedStringArray):
	visible=true
	Seales.moverte=false
	$C/TT/TN/N.text=namedial
#	var tewn=create_tween()
#	if numdial<dial.size():
	for di in dial:
		$C/TT/T.text=di
#			$C/TT/T.visible_ratio=0.0
#			var dura=vel*di.length()
#			tewn.tween_property($C/TT/T,"visible_ratio",1.0,dura)
		await $B.button_down
	visible=false
	Seales.moverte=true
	emit_signal("FIN")

