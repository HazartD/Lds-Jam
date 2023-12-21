extends Entidad
var steam:Array[String]=[]#sonidos
var tim:float=0.0
const animid=["down_idle","up_idle","right_idle","letf_idle"]
const anim=["down","letf","right","up"]
const _spead=150
var move:Vector2


func _physics_process(delta):
	if tim>0.0:tim-=delta
	else:
		tim=randf_range(1.0,5.0)
		move= Vector2(randi_range(-1,1),randi_range(-1,1))
		for a in range(10):if move!=Vector2.ZERO:move= Vector2(randi_range(-1,1),randi_range(-1,1))
		print("time: ",tim,"  move: ",move)
		if move==Vector2.ZERO:$gil.play(animid.pick_random())
		else:
			$gil.play(anim.pick_random())
			while move.y==0 and $gil.animation==anim[0] or $gil.animation==anim[3]:$gil.play(anim.pick_random())
			while move.x==0 and $gil.animation==anim[1] or $gil.animation==anim[2]:$gil.play(anim.pick_random())
			if $gil.animation==anim[0] and move.y<0:$gil.play("up")
			if $gil.animation==anim[1] and move.x>0:$gil.play("right")
			if $gil.animation==anim[2] and move.x<0:$gil.play("letf")
			if $gil.animation==anim[3] and move.y>01:$gil.play("down")
	
	velocity=move*_spead
			
	move_and_slide()

func _ready():
#	$balido.stream=load(steam[number])
	steam.clear()
func _on_interaccion():
	pass


func _on_gil_animation_finished():
	if tim<=0:$gil.play($gil.animation)
	else:$gil.play(animid.pick_random())
