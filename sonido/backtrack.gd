extends Node
@export var intro:Resource
@export var loop:Resource
@export var change:bool=false
func _ready():
	$intro.stream=intro
	$loop.stream=loop
	Seales.change.connect(after)
	if Progresos.mode_after:
		if change:$intro.play()
		else:queue_free()
	else: if !change:$intro.play()

func _on_intro_finished():
	$loop.play()
	$intro.queue_free()
func after():
	if change:$intro.play()
	else:queue_free()
func _on_loop_finished():
	$loop.play()
