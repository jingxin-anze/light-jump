extends CharacterBody2D

enum State{flay,idle,reading}

var dir:Vector2
var audio:AudioStreamPlayer
var is_flay_away:bool
var first_idle:bool=true
var first_reading:bool=true

const BAT = preload("res://Asset/Sounds/Level2/bat_02.mp3")

@export var speed:float=100
@export var state:int=State.idle

@onready var anim: AnimatedSprite2D = $AnimatedSprite2D
@onready var player:CharacterBody2D=get_tree().get_first_node_in_group("player")

func _physics_process(delta: float) -> void:
	#print(state)
	match state:
		State.idle:
			anim.play("Idle")
			idle_state()
		State.flay:
			anim.play("Flay")
			flay_state(delta)
		State.reading:
			anim.play("Reading")
			reading_state()
	pass

func _on_checker_body_entered(body: Node2D) -> void:
	if body.name=="Player":
		state=State.flay

func idle_state():
	if first_idle:
		if is_instance_valid(audio):
			AudioPlayer.destroy(audio)
		is_flay_away=false
		await get_tree().create_timer(7).timeout
		state=State.reading
		first_idle=true
	else:
		return

func flay_state(dt):
	if not is_flay_away:
		audio=AudioPlayer.play(BAT,true,false,4)
		dir=-(self.position-player.position).normalized()
		if_near(player.position)
		anim.flip_h=false if dir.x<0 else true
		velocity=dir*speed*dt
		
	else:
		randomize()
		var rand:Vector2=Vector2(randi_range(500,2000),randi_range(-500,-600))
		dir=-(self.position-rand).normalized()
		if_near(rand)
		anim.flip_h=false if dir.x<0 else true
		velocity=dir*speed*dt
	
	move_and_collide(velocity)
	pass

func reading_state():
	if first_reading:
		if is_instance_valid(audio):
			AudioPlayer.destroy(audio)
		await get_tree().create_timer(2).timeout
		state=State.flay
		first_reading=true
	else:
		return

func if_near(pos:Vector2):
	if abs(self.position-pos).x<10:
		state=State.idle



	
