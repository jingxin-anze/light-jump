extends RigidBody2D

var player:CharacterBody2D
var hand:AnimatedSprite2D
var impulse:Vector2=Vector2(100,0)
var current_degrees:float

const SCRAPE = preload("res://Asset/Sounds/Level1/scrape.MP3")
const FROG = preload("res://Asset/Sounds/Level1/frog.mp3")

func _ready() -> void:
	set_process(false)
	#从全局组里获得玩家
	player=get_tree().get_first_node_in_group("player")
	#获得动画
	hand=player.get_node("Body/Hand")

func _process(_delta: float) -> void:
	#判断检测物是否为玩家

	if $Left.is_colliding() && $Left.get_collider().name=="Player":
		#若玩家动画为攻击二的第二帧则移动
		if hand.animation=="Atack2" && hand.frame==2:
			apply_central_impulse(impulse)
			AudioPlayer.play(SCRAPE,false,true,-6)
			
	#判断检测物是否为玩家
	if $Right.is_colliding() && $Right.get_collider().name=="Player":
		#若玩家动画为攻击二的第二帧则移动
		if hand.animation=="Atack2" && hand.frame==5:
			apply_central_impulse(-impulse)
			AudioPlayer.play(SCRAPE,false,true,-6)
	
	#变换冲量
	if abs(self.rotation_degrees)-abs(current_degrees)>50:
		if abs(self.rotation_degrees)>170:
			impulse=Vector2(100,0)
			self.rotation_degrees=current_degrees
		elif abs(self.rotation_degrees)<10:
			impulse=-Vector2(100,0)
			self.rotation_degrees=current_degrees
		
