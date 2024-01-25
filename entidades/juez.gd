extends Entidad
const mover:Array=[[Vector2.ZERO,90],[Vector2.ZERO,-90],[Vector2.ZERO,0],[Vector2.ZERO,180],[Vector2.LEFT,0],[Vector2.RIGHT,180],[Vector2.UP,90],[Vector2.DOWN,-90]]
const SPEED=3000
const SPEED2=6000
const dialogos=["jGood","jBad","jDead"]
var tim:float=0.0
var siguiendo:bool=false
var player:Player
var move:Vector2

func _ready():
	player=get_tree().get_nodes_in_group("play")[0]
	$deteccion.body_entered.connect(func():emit_signal("interaccion"))
func _physics_process(delta):
	if siguiendo:
		tim=0.0
		move=(player.position-position).normalized()
		move*=SPEED2
	else:
		if tim>0.0:tim-=delta
		else:
			tim=randf_range(1.0,10.0)
			var mo=mover.pick_random()
			move=mo[0]
			move*=SPEED
			$vista.rotation=mo[1]
#			print(move,"normal")
	velocity=move*delta
	move_and_slide()

func _on_animated_sprite_2d_animation_finished():
	if move==Vector2.ZERO:pass
	else: $asped.play($asped.animation)
func _on_area_2d_2_body_exited(_body):
	siguiendo=false
func _on_vista_body_entered(_body):
	siguiendo=true
	$anim.play("detec")
func _on_interaccion():
	pass # Replace with function body.
