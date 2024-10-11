extends RigidBody2D

var player:CharacterBody2D
var hand:AnimatedSprite2D
func _ready() -> void:
	#从全局组里获得玩家
	player=get_tree().get_first_node_in_group("player")
	#获得动画
	hand=player.get_node("Body/Hand")

func _process(delta: float) -> void:
	#判断检测物是否为玩家
	if $Left.is_colliding() && $Left.get_collider().name=="Player":
		#若玩家动画为攻击二的第二帧则移动
		if hand.animation=="Atack2" && hand.frame==2:
			self.position.x+=38
			
	#判断检测物是否为玩家
	if $Right.is_colliding() && $Right.get_collider().name=="Player":
		#若玩家动画为攻击二的第二帧则移动
		if hand.animation=="Atack2" && hand.frame==2:
			self.position.x+=-38
