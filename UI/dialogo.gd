extends CanvasLayer
signal FIN

func fadein():
	var inout= get_tree().create_tween()
	inout.tween_property($Control,"modulate:a",1,0.5)
	$Control/B.set_focus_mode(Control.FOCUS_ALL)
	$Control/B.visible=true
	$Control/B.grab_focus()
func fadeout():
	var inout= get_tree().create_tween()
	inout.tween_property($Control,"modulate:a",0,0.5)
	$Control/B.visible=false
	$Control/B.set_focus_mode(Control.FOCUS_NONE)
func opsele():
	for op in $Control/O.get_children():op.queue_free()
	fadeout()
	emit_signal("FIN")



func metertexto(dial:PackedStringArray,namedial:String="Elizabeth"):
	fadein()
	$Control/C/TT/TN/N.text=namedial
	for di in dial:
		$Control/C/TT/T.text=di
		await $Control/B.button_down
	fadeout()
	emit_signal("FIN")


func opcion(opciones:Dictionary,pregunta:String="",nameop:String="Elizabeth"):
	$Control/C/TT/TN/N.text=nameop
	$Control/C/TT/T.text=pregunta
	$Control/C/TT/T.visible_ratio=1.0
	for op in opciones.keys():
		print(op)
		var butt:Button= Button.new()
		butt.name=op
		butt.text=op
		$Control/O.add_child(butt)
		butt.button_down.connect(opsele)
		butt.button_down.connect(opciones[op])
	$Control/O.get_child(0).grab_focus()


