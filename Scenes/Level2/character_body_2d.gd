extends CharacterBody2D

enum State{flay,idle,reading}

var dir:Vector2
var audio:AudioStreamPlayer
var is_flay_away:bool
var first_idle:bool=true
var first_reading:bool=true
var rand:Vector2
var is_bat:bool=true

const BAT = preload("res://Asset/Sounds/Level2/bat_02.mp3")

@export var speed:float=100
@export var state:int=State.idle

@onready var anim: AnimatedSprite2D = $AnimatedSprite2D
@onready var player:CharacterBody2D=get_tree().get_first_node_in_group("player")

func _ready() -> void:
	#给每个蝙蝠随机不同的返回点
	randomize()
	rand=Vector2(randi_range(-200,4500),randi_range(-1500,-2000))

func _physics_process(delta: float) -> void:
	#每帧检测，切换状态
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


func idle_state():
	#判断是否进入过
	if first_idle:
		#调整切换状态的条件
		first_reading=true
		first_idle=false
		#销毁播放器
		#if is_instance_valid(audio):
			#AudioPlayer.destroy(audio)
		#重置飞远
		is_flay_away=false
		#等待五秒切换到reading
		await get_tree().create_timer(5).timeout
		state=State.reading
	else:
		return

func flay_state(dt):
	#调整切换状态的条件
	first_idle=true
	first_reading=false
	#若不飞远，则飞向玩家
	if not is_flay_away:
		#创建播放器并播放
		#audio=AudioPlayer.play(BAT,true,false,4)
		#获得玩家方向
		dir=-(self.position-player.position).normalized()
		#调整翻转
		anim.flip_h=false if dir.x<0 else true
		##若接近目标点进入此函数
		#if_near(player.position)
		#赋值velocity
		velocity=dir*speed*dt
	else:
		#获得目标点方向
		dir=-(self.position-rand).normalized()
		#调整翻转
		anim.flip_h=false if dir.x<0 else true
		#若接近目标点进入此函数
		if_near(rand)
		#赋值velocity
		velocity=dir*speed*dt
	#沿着velocity移动
	move_and_collide(velocity)
	pass

func reading_state():
	#判断是否进入过
	if first_reading:
		#将reading设为false
		first_reading=false
		#销毁播放器
		#if is_instance_valid(audio):
			#AudioPlayer.destroy(audio)
		#等待1.5秒进入flay状态
		await get_tree().create_timer(1.5).timeout
		state=State.flay
	else:
		return

func if_near(pos:Vector2):
	#若小于3则进入Idle状态
	if abs(self.position-pos).x<3:
		state=State.idle

#若无灯光，则靠近玩家并飞离
func _on_body_body_entered(body: Node2D) -> void:
		body.SPEED/=2
		AudioPlayer.play(preload("res://Asset/Sounds/Level2/hurt.mp3"))
		is_flay_away=true
		await get_tree().create_timer(5).timeout
		body.SPEED*=2
		

#若进入区域，直接追击,此功能有bug，等会再修 ψ(*｀ー´)ψ
#func _on_checker_body_entered(body: Node2D) -> void:
	#if body.name=="Player":
		#state=State.flay
		#is_flay_away=false


func _on_timer_timeout() -> void:
	randomize()
	var randi:int=randi_range(0,3)
	if	is_equal_approx(randi,0):
		audio=AudioPlayer.play(BAT,false,true,4)
