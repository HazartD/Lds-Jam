extends CanvasLayer
const vel:float=0.2
signal FIN
signal cargar_op

func fadein():
	var inout= get_tree().create_tween()
	inout.tween_property($Control,"modulate:a",1,0.5)

func fadeout():
	var inout= get_tree().create_tween()
	inout.tween_property($Control,"modulate:a",0,0.5)

func metertexto(dial:PackedStringArray,namedial:String="Elizabeth"):
	fadein()
#	visible=true
	
	$Control/C/TT/TN/N.text=namedial
	$Control/B.grab_focus()
	for di in dial:
		$Control/C/TT/T.text=di
		shoe()
		await $Control/B.button_down
#	visible=false
	fadeout()
	emit_signal("FIN")
	


func shoe():
	var tewn=create_tween()
	$Control/C/TT/T.visible_ratio=0.0
	var dura=vel*$Control/C/TT/T.text.length()
	tewn.tween_property($Control/C/TT/T,"visible_ratio",1.0,dura)

func opcion(opciones:Dictionary,pregunta:String="",nameop:String="Elizabeth"):
#	visible=true
	
	$Control/C/TT/TN/N.text=nameop
	$Control/C/TT/T.text=pregunta
	for op in opciones.keys():
		print(op)
		var butt:Button= Button.new()
		butt.name=op
		butt.text=op
		$Control/O.add_child(butt)
		butt.button_down.connect(opsele)
		butt.button_down.connect(opciones[op])
		
		
	
			
			
		
	$Control/O.get_child(0).grab_focus()
	$Control/B.set_focus_mode(Control.FOCUS_NONE)


func opsele():
	for op in $Control/O.get_children():op.queue_free()
#	visible=false
	fadeout()
	
	
	emit_signal("FIN")
	$Control/B.set_focus_mode(Control.FOCUS_ALL)
